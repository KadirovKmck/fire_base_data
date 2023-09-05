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
    apiKey: 'AIzaSyDOv7GoKUeE_-oB6pKrbi6gw5rU0EOKZII',
    appId: '1:370683696091:web:5300f24875775c8dbc0dfe',
    messagingSenderId: '370683696091',
    projectId: 'project-1a857',
    authDomain: 'project-1a857.firebaseapp.com',
    storageBucket: 'project-1a857.appspot.com',
    measurementId: 'G-EV5NKQ2WF9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeQGhzzlmno88LT3fe8r7CG8YBPaW5eyE',
    appId: '1:370683696091:android:7ac5fbc3df65cbc6bc0dfe',
    messagingSenderId: '370683696091',
    projectId: 'project-1a857',
    storageBucket: 'project-1a857.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_QTP5Se5yFrBBW3pKIc9CmiWnnBqBFU0',
    appId: '1:370683696091:ios:0e2d178ce53d0d43bc0dfe',
    messagingSenderId: '370683696091',
    projectId: 'project-1a857',
    storageBucket: 'project-1a857.appspot.com',
    iosClientId: '370683696091-7o6oum7p7sn4fq25e21pim59dsbvr88h.apps.googleusercontent.com',
    iosBundleId: 'com.example.fireBaseData',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_QTP5Se5yFrBBW3pKIc9CmiWnnBqBFU0',
    appId: '1:370683696091:ios:d38aa61c136c6979bc0dfe',
    messagingSenderId: '370683696091',
    projectId: 'project-1a857',
    storageBucket: 'project-1a857.appspot.com',
    iosClientId: '370683696091-5sa0rcmmql5d2jfshiljnu6ka0fvfbb6.apps.googleusercontent.com',
    iosBundleId: 'com.example.fireBaseData.RunnerTests',
  );
}