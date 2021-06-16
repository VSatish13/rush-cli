import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:process_runner/process_runner.dart';
import 'package:rush_cli/commands/build_command/helpers/compute.dart';
import 'package:rush_cli/commands/build_command/models/rush_yaml.dart';
import 'package:rush_cli/helpers/cmd_utils.dart';
import 'package:rush_cli/helpers/process_streamer.dart';
import 'package:rush_prompt/rush_prompt.dart';

class Desugarer {
  final String _cd;
  final String _dataDir;

  Desugarer(this._cd, this._dataDir);

  /// Desugars the extension files and dependencies making them
  /// compatible with Android API level < 26.
  Future<void> run(String org, RushYaml yaml, BuildStep step) async {
    final desugarDeps = yaml.build?.desugar?.desugar_deps ?? false;
    final deps = desugarDeps ? _depsToBeDesugared(org, yaml.deps ?? []) : [];

    // Here, all the desugar process' futures are stored for them
    // to get excecuted parallely by the [Future.wait] method.
    final desugarFutures = <Future>[];

    // This is where all previously desugared deps of the extension
    // are stored. They are reused between builds.
    final desugarStore =
        Directory(p.join(_dataDir, 'workspaces', org, 'files', 'desugar'))
          ..createSync(recursive: true);

    deps.forEach((el) {
      final output = p.join(desugarStore.path, p.basename(el));
      final args = _DesugarArgs(_cd, _dataDir, el, output, org, step);
      desugarFutures.add(compute(_desugar, args));
    });

    // Desugar extension classes
    final classesDir = p.join(_dataDir, 'workspaces', org, 'classes');
    desugarFutures.add(compute(_desugar,
        _DesugarArgs(_cd, _dataDir, classesDir, classesDir, org, step)));

    await Future.wait(desugarFutures);
  }

  /// Returns a list of extension dependencies that are to be desugared.
  List<String> _depsToBeDesugared(String org, List<String> deps) {
    final res = <String>[];

    final store =
        Directory(p.join(_dataDir, 'workspaces', org, 'files', 'desugar'))
          ..createSync(recursive: true);
    final depsDir = p.join(_cd, 'deps');

    for (final el in deps) {
      final depDes = File(p.join(store.path, el));
      final depOrig = File(p.join(depsDir, el));

      // Add the dep if it isn't already desugared
      if (!depDes.existsSync()) {
        res.add(depOrig.path);
        continue;
      }

      // Add the dep if it's original file is modified
      final isModified =
          depOrig.lastModifiedSync().isAfter(depDes.lastModifiedSync());
      if (isModified) {
        res.add(depOrig.path);
      }
    }

    return res;
  }

  /// Desugars the specified JAR file or a directory of class files.
  static Future<void> _desugar(_DesugarArgs args) async {
    final desugarJar = p.join(args.dataDir, 'tools', 'other', 'desugar.jar');

    final classpath = CmdUtils.generateClasspath([
      Directory(p.join(args.cd, '.rush', 'dev-deps')),
      Directory(p.join(args.cd, 'deps'))
    ], relative: false);

    final argFile = () {
      final rtJar = p.join(args.dataDir, 'tools', 'other', 'rt.jar');

      final contents = <String>[];
      contents
        ..add('--emit_dependency_metadata_as_needed')
        ..add('--desugar_try_with_resources_if_needed')
        ..addAll(['--bootclasspath_entry', rtJar])
        ..addAll(['--input', args.input])
        ..addAll(['--output', args.output]);

      classpath.split(CmdUtils.getSeparator()).forEach((el) {
        contents.addAll(['--classpath_entry', el]);
      });

      final file = File(p.join(args.dataDir, 'workspaces', args.org, 'files',
          'desugar', p.basenameWithoutExtension(args.input) + '.rsh'));

      file.writeAsStringSync(contents.join('\n'));

      return file;
    }();

    final cmdArgs = <String>[];
    cmdArgs
      ..add('java')
      ..addAll(['-cp', desugarJar])
      ..add('com.google.devtools.build.android.desugar.Desugar')
      ..add('@${p.basename(argFile.path)}');

    final process = ProcessStreamer.stream(cmdArgs,
        workingDirectory: Directory(p.dirname(argFile.path)));

    try {
      // ignore: unused_local_variable
      await for (final r in process) {}
    } on ProcessRunnerException catch (e) {
      final errPattern = RegExp(r'\s*error:?\s?', caseSensitive: false);

      final errList = e.result!.stderr.split('\n');
      errList.forEach((el) {
        if (el.startsWith(errPattern)) {
          args.step.log(LogType.erro, el.replaceFirst(errPattern, ''));
        } else {
          args.step.log(LogType.erro, ' ' * 5 + el, addPrefix: false);
        }
      });
      rethrow;
    }

    argFile.deleteSync();
  }
}

/// Arguments of the [Desugarer._desugar] method. This class is used
/// instead of directly passing required args to that method because
/// when running a method in an [Isolate], we can only pass one arg
/// to it.
class _DesugarArgs {
  final String cd;
  final String org;
  final String input;
  final String output;
  final String dataDir;
  final BuildStep step;

  _DesugarArgs(
      this.cd, this.dataDir, this.input, this.output, this.org, this.step);
}