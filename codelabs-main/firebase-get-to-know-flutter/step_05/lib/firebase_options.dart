// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCUGJKdxdVa_jc-ZXhlsLrpTIFrpovBJdk',
    appId: '1:876779524642:web:4381eccfc475969180b07b',
    messagingSenderId: '876779524642',
    projectId: 'fir-flutter-codelab-9b3ab',
    authDomain: 'fir-flutter-codelab-9b3ab.firebaseapp.com',
    storageBucket: 'fir-flutter-codelab-9b3ab.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAn1Vf_fWooR7DpcQyklEzpqsncQad_ncQ',
    appId: '1:876779524642:android:fbe82641b9cc8eb480b07b',
    messagingSenderId: '876779524642',
    projectId: 'fir-flutter-codelab-9b3ab',
    storageBucket: 'fir-flutter-codelab-9b3ab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCulYTsbsgxUbNIuzTc7wycO2_4YJv50ic',
    appId: '1:876779524642:ios:adf025283869614980b07b',
    messagingSenderId: '876779524642',
    projectId: 'fir-flutter-codelab-9b3ab',
    storageBucket: 'fir-flutter-codelab-9b3ab.appspot.com',
    iosBundleId: 'com.example.gtkFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCulYTsbsgxUbNIuzTc7wycO2_4YJv50ic',
    appId: '1:876779524642:ios:501a27569611246c80b07b',
    messagingSenderId: '876779524642',
    projectId: 'fir-flutter-codelab-9b3ab',
    storageBucket: 'fir-flutter-codelab-9b3ab.appspot.com',
    iosBundleId: 'com.example.gtkFlutter.RunnerTests',
  );
}
