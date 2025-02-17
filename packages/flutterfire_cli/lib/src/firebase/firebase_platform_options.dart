import '../common/utils.dart';
import '../flutter_app.dart';
import 'firebase_android_options.dart';
import 'firebase_apple_options.dart';
import 'firebase_dart_options.dart';
import 'firebase_options.dart';

class FirebasePlatformOptions {
  FirebasePlatformOptions({
    this.androidOptions,
    this.iosOptions,
    this.macosOptions,
    this.webOptions,
    this.linuxOptions,
    this.windowsOptions,
  });

  FirebaseOptions? androidOptions;
  FirebaseOptions? iosOptions;
  FirebaseOptions? macosOptions;
  FirebaseOptions? webOptions;
  FirebaseOptions? linuxOptions;
  FirebaseOptions? windowsOptions;
}

Future<FirebasePlatformOptions> fetchAllFirebaseOptions({
  required FlutterApp flutterApp,
  required String firebaseProjectId,
  required bool windows,
  required bool linux,
  required bool web,
  required bool ios,
  required bool macos,
  required bool android,
  String? firebaseAccount,
  String? webAppId,
  String? androidApplicationId,
  String? iosBundleId,
  String? macosBundleId,
  String? token,
}) async {
  FirebaseOptions? androidOptions;
  FirebaseOptions? iosOptions;
  FirebaseOptions? macosOptions;
  FirebaseOptions? webOptions;
  FirebaseOptions? linuxOptions;
  FirebaseOptions? windowsOptions;

  if (android) {
    androidOptions = await FirebaseAndroidOptions.forFlutterApp(
      flutterApp,
      androidApplicationId: androidApplicationId,
      firebaseProjectId: firebaseProjectId,
      firebaseAccount: firebaseAccount,
      token: token,
    );
  }

  if (ios) {
    iosOptions = await FirebaseAppleOptions.forFlutterApp(
      flutterApp,
      appleBundleIdentifier: iosBundleId,
      firebaseProjectId: firebaseProjectId,
      firebaseAccount: firebaseAccount,
      token: token,
    );
  }
  if (macos) {
    macosOptions = await FirebaseAppleOptions.forFlutterApp(
      flutterApp,
      appleBundleIdentifier: macosBundleId,
      firebaseProjectId: firebaseProjectId,
      firebaseAccount: firebaseAccount,
      macos: true,
      token: token,
    );
  }

  if (web) {
    webOptions = await FirebaseDartOptions.forFlutterApp(
      flutterApp,
      firebaseProjectId: firebaseProjectId,
      firebaseAccount: firebaseAccount,
      webAppId: webAppId,
      token: token,
    );
  }

  if (windows) {
    windowsOptions = await FirebaseDartOptions.forFlutterApp(
      flutterApp,
      firebaseProjectId: firebaseProjectId,
      firebaseAccount: firebaseAccount,
      platform: kWindows,
      token: token,
    );
  }

  if (linux) {
    linuxOptions = await FirebaseDartOptions.forFlutterApp(
      flutterApp,
      firebaseProjectId: firebaseProjectId,
      firebaseAccount: firebaseAccount,
      platform: kLinux,
      token: token,
    );
  }

  return FirebasePlatformOptions(
    androidOptions: androidOptions,
    iosOptions: iosOptions,
    macosOptions: macosOptions,
    webOptions: webOptions,
    linuxOptions: linuxOptions,
    windowsOptions: windowsOptions,
  );
}
