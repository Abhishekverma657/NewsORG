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
    apiKey: 'AIzaSyDTplBCvRrDVr9LPVcmiFo_3r5pyovDj40',
    appId: '1:631980998095:web:542f88a13b522493ed66ba',
    messagingSenderId: '631980998095',
    projectId: 'news-a3e2e',
    authDomain: 'news-a3e2e.firebaseapp.com',
    storageBucket: 'news-a3e2e.appspot.com',
    measurementId: 'G-2BS8QHZDD2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAc1EYapm2NUP2y1E8ZBnXuPK21nRcPEAg',
    appId: '1:631980998095:android:d5b372bd83c9b8d6ed66ba',
    messagingSenderId: '631980998095',
    projectId: 'news-a3e2e',
    storageBucket: 'news-a3e2e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCT0Hs2WPJl5zgZR4IUGrhPWWtaR1XNM0',
    appId: '1:631980998095:ios:87d288a9840245a6ed66ba',
    messagingSenderId: '631980998095',
    projectId: 'news-a3e2e',
    storageBucket: 'news-a3e2e.appspot.com',
    iosClientId: '631980998095-vsjhljsrm1rn49sk55od32a5jvqcp8ql.apps.googleusercontent.com',
    iosBundleId: 'com.example.newsapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCT0Hs2WPJl5zgZR4IUGrhPWWtaR1XNM0',
    appId: '1:631980998095:ios:87d288a9840245a6ed66ba',
    messagingSenderId: '631980998095',
    projectId: 'news-a3e2e',
    storageBucket: 'news-a3e2e.appspot.com',
    iosClientId: '631980998095-vsjhljsrm1rn49sk55od32a5jvqcp8ql.apps.googleusercontent.com',
    iosBundleId: 'com.example.newsapp',
  );
}
