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
    apiKey: 'AIzaSyACOL18brpFrAxov_pd1TZNWkDgZZaAsqM',
    appId: '1:730936628748:web:5ce53ed68b3607a278c029',
    messagingSenderId: '730936628748',
    projectId: 'expensive-chat-8faa6',
    authDomain: 'expensive-chat-8faa6.firebaseapp.com',
    storageBucket: 'expensive-chat-8faa6.appspot.com',
    measurementId: 'G-LK498KYS57',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwIk4FDLsdB52EqE4oNEtNo3lUS9DSgCU',
    appId: '1:730936628748:android:372cb5f7595c0ccb78c029',
    messagingSenderId: '730936628748',
    projectId: 'expensive-chat-8faa6',
    storageBucket: 'expensive-chat-8faa6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBL4SFnJ9E2Wl82u2zCE7qCkRaAoGchmuo',
    appId: '1:730936628748:ios:5cfe4b03d9bd893278c029',
    messagingSenderId: '730936628748',
    projectId: 'expensive-chat-8faa6',
    storageBucket: 'expensive-chat-8faa6.appspot.com',
    iosClientId: '730936628748-m70pd7kjb186qvcl1128l2jf6h1q5ncd.apps.googleusercontent.com',
    iosBundleId: 'com.egemenerdem.expensiveChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBL4SFnJ9E2Wl82u2zCE7qCkRaAoGchmuo',
    appId: '1:730936628748:ios:5cfe4b03d9bd893278c029',
    messagingSenderId: '730936628748',
    projectId: 'expensive-chat-8faa6',
    storageBucket: 'expensive-chat-8faa6.appspot.com',
    iosClientId: '730936628748-m70pd7kjb186qvcl1128l2jf6h1q5ncd.apps.googleusercontent.com',
    iosBundleId: 'com.egemenerdem.expensiveChat',
  );
}
