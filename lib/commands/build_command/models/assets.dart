import 'package:json_annotation/json_annotation.dart';

part 'assets.g.dart';

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
)
class Assets {
  @JsonKey(required: true)
  final String icon;
  final List<String>? other;

  Assets({required this.icon, this.other});

  factory Assets.fromJson(Map json) => _$AssetsFromJson(json);

  Map<String, dynamic> toJson() => _$AssetsToJson(this);
}