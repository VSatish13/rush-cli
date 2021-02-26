String getDotClasspath(String depsDir) {
  return '''
<?xml version="1.0" encoding="UTF-8"?>
<classpath>
	<classpathentry kind="src" path="src/" />
	<classpathentry kind="lib" path="$depsDir/acra-4.9.0.jar" />
	<classpathentry kind="lib" path="$depsDir/android-2.1.2.jar" />
	<classpathentry kind="lib" path="$depsDir/androidsvg-1.2.1.jar" />
	<classpathentry kind="lib" path="$depsDir/annotation-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/annotations-v186a.jar" />
	<classpathentry kind="lib" path="$depsDir/appcompat-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/asynclayoutinflater-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/checker-compat-qual-2.5.5.jar" />
	<classpathentry kind="lib" path="$depsDir/collection-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/commons-codec-1.11.jar" />
	<classpathentry kind="lib" path="$depsDir/commons-logging-1.2.jar" />
	<classpathentry kind="lib" path="$depsDir/commons-pool2-2.6.2.jar" />
	<classpathentry kind="lib" path="$depsDir/constraintlayout-1.1.0.jar" />
	<classpathentry kind="lib" path="$depsDir/constraintlayout-solver-1.1.0.jar" />
	<classpathentry kind="lib" path="$depsDir/coordinatorlayout-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/core-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/core-common-2.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/core-runtime-2.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/cursoradapter-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/customview-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/documentfile-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/drawerlayout-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/error_prone_annotations-2.3.4.jar" />
	<classpathentry kind="lib" path="$depsDir/failureaccess-1.0.1.jar" />
	<classpathentry kind="lib" path="$depsDir/firebase-client-android-2.5.2.jar" />
	<classpathentry kind="lib" path="$depsDir/firebase-client-jvm-2.5.2.jar" />
	<classpathentry kind="lib" path="$depsDir/fragment-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/google-api-client-1.31.1.jar" />
	<classpathentry kind="lib" path="$depsDir/google-api-client-android2-1.10.3-beta.jar" />
	<classpathentry kind="lib" path="$depsDir/google-http-client-1.38.0.jar" />
	<classpathentry kind="lib" path="$depsDir/google-http-client-apache-v2-1.38.0.jar" />
	<classpathentry kind="lib" path="$depsDir/google-http-client-jackson2-1.38.0.jar" />
	<classpathentry kind="lib" path="$depsDir/google-oauth-client-1.31.2.jar" />
	<classpathentry kind="lib" path="$depsDir/google-webrtc-1.0.23995.jar" />
	<classpathentry kind="lib" path="$depsDir/grpc-context-1.22.1.jar" />
	<classpathentry kind="lib" path="$depsDir/guava-30.0-android.jar" />
	<classpathentry kind="lib" path="$depsDir/httpclient-4.5.13.jar" />
	<classpathentry kind="lib" path="$depsDir/httpcore-4.4.13.jar" />
	<classpathentry kind="lib" path="$depsDir/httpmime-4.3.4.jar" />
	<classpathentry kind="lib" path="$depsDir/interpolator-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/j2objc-annotations-1.3.jar" />
	<classpathentry kind="lib" path="$depsDir/jackson-annotations-2.2.2.jar" />
	<classpathentry kind="lib" path="$depsDir/jackson-core-2.11.3.jar" />
	<classpathentry kind="lib" path="$depsDir/jackson-databind-2.2.2.jar" />
	<classpathentry kind="lib" path="$depsDir/jedis-3.1.0.jar" />
	<classpathentry kind="lib" path="$depsDir/json-20080701.jar" />
	<classpathentry kind="lib" path="$depsDir/jsr305-3.0.2.jar" />
	<classpathentry kind="lib" path="$depsDir/jts-core-1.16.1.jar" />
	<classpathentry kind="lib" path="$depsDir/kawa-1.11-modified.jar" />
	<classpathentry kind="lib" path="$depsDir/legacy-support-core-ui-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/legacy-support-core-utils-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/legacy-support-v4-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/lifecycle-common-2.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/lifecycle-livedata-2.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/lifecycle-livedata-core-2.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/lifecycle-runtime-2.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/lifecycle-viewmodel-2.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar" />
	<classpathentry kind="lib" path="$depsDir/loader-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/localbroadcastmanager-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/media-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/opencensus-api-0.24.0.jar" />
	<classpathentry kind="lib" path="$depsDir/opencensus-contrib-http-util-0.24.0.jar" />
	<classpathentry kind="lib" path="$depsDir/opengl-api-gl1.1-android-2.1_r1.jar" />
	<classpathentry kind="lib" path="$depsDir/org.apache.http.legacy.jar" />
	<classpathentry kind="lib" path="$depsDir/osmdroid-android-6.1.0.jar" />
	<classpathentry kind="lib" path="$depsDir/physicaloid-library.jar" />
	<classpathentry kind="lib" path="$depsDir/print-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/runtime-v186a.jar" />
	<classpathentry kind="lib" path="$depsDir/slf4j-api-1.7.25.jar" />
	<classpathentry kind="lib" path="$depsDir/slidingpanelayout-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/swiperefreshlayout-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/tubesock-0.0.12.jar" />
	<classpathentry kind="lib" path="$depsDir/vectordrawable-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/vectordrawable-animated-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/versionedparcelable-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/viewpager-1.0.0.jar" />
	<classpathentry kind="lib" path="$depsDir/xmlParserAPIs-2.6.2.jar" />
	<classpathentry kind="lib" path="$depsDir/xpp3-1.1.4c.jar" />
	<classpathentry kind="output" path="out" />
</classpath>
''';
}
