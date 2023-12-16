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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAZScv3mgL2qTaVj8DcLYGEZMPUKRz5WHM',
    appId: '1:727040272170:web:cdf70301e2e904a929e053',
    messagingSenderId: '727040272170',
    projectId: 'tamil-vivaham',
    authDomain: 'tamil-vivaham.firebaseapp.com',
    storageBucket: 'tamil-vivaham.appspot.com',
    measurementId: 'G-W9B0QKV4ZD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzKxO_ytVIBbZdrWtvXtzV2ch6spF7fX8',
    appId: '1:727040272170:android:cde6b9490107bbd929e053',
    messagingSenderId: '727040272170',
    projectId: 'tamil-vivaham',
    storageBucket: 'tamil-vivaham.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6LUSHVNmgfGFU4BjoIUd4w5fOujpAi1Y',
    appId: '1:727040272170:ios:beac8d737106bcc829e053',
    messagingSenderId: '727040272170',
    projectId: 'tamil-vivaham',
    storageBucket: 'tamil-vivaham.appspot.com',
    androidClientId: '727040272170-m2ap7bhbbpv5uh1vm9i9jhfhc0ae8etl.apps.googleusercontent.com',
    iosClientId: '727040272170-i4iuakqrfsdt0p1gtam9sk7nkm9gbo9n.apps.googleusercontent.com',
    iosBundleId: 'com.tamilvivaham.thirumanam',
  );
}


