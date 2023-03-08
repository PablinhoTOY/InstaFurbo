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
    apiKey: 'AIzaSyA53S5e2bindg0W0vO_G7ko4upDmOPthbE',
    appId: '1:598161869904:web:fb4400b4a6264a7ac41555',
    messagingSenderId: '598161869904',
    projectId: 'instafurbo',
    authDomain: 'instafurbo.firebaseapp.com',
    storageBucket: 'instafurbo.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1mGmxUgTwEdKK_0KPn3iw39cjrra6aMc',
    appId: '1:598161869904:android:616e5e7d1c81b6e8c41555',
    messagingSenderId: '598161869904',
    projectId: 'instafurbo',
    storageBucket: 'instafurbo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpWxOmzPy8hhx4R6MYqtLJR13gyW-9_Ho',
    appId: '1:598161869904:ios:1e79f965dd07ff68c41555',
    messagingSenderId: '598161869904',
    projectId: 'instafurbo',
    storageBucket: 'instafurbo.appspot.com',
    iosClientId: '598161869904-6f059v3e0380k1gvd04abmorsra66kov.apps.googleusercontent.com',
    iosBundleId: 'com.example.instaFurbo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpWxOmzPy8hhx4R6MYqtLJR13gyW-9_Ho',
    appId: '1:598161869904:ios:1e79f965dd07ff68c41555',
    messagingSenderId: '598161869904',
    projectId: 'instafurbo',
    storageBucket: 'instafurbo.appspot.com',
    iosClientId: '598161869904-6f059v3e0380k1gvd04abmorsra66kov.apps.googleusercontent.com',
    iosBundleId: 'com.example.instaFurbo',
  );
}