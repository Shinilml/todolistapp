// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAlCpyfFdt2LI1aNvpl4cz1xKRmHP3kKWI',
    appId: '1:949608325040:web:347a5b2a4718c7165d8075',
    messagingSenderId: '949608325040',
    projectId: 'fir-sample-1ac6b',
    authDomain: 'fir-sample-1ac6b.firebaseapp.com',
    storageBucket: 'fir-sample-1ac6b.firebasestorage.app',
    measurementId: 'G-6Y49BHHTNS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuUUdcUUU20-LVWkWUAZQjFnmhUZ1nlPE',
    appId: '1:949608325040:android:bf394b96ea2125a65d8075',
    messagingSenderId: '949608325040',
    projectId: 'fir-sample-1ac6b',
    storageBucket: 'fir-sample-1ac6b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgl54WXRZcGMt77zfQw5aBdjnYKqlVg2M',
    appId: '1:949608325040:ios:89660d1e835821dc5d8075',
    messagingSenderId: '949608325040',
    projectId: 'fir-sample-1ac6b',
    storageBucket: 'fir-sample-1ac6b.firebasestorage.app',
    iosBundleId: 'com.example.todolistappexm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgl54WXRZcGMt77zfQw5aBdjnYKqlVg2M',
    appId: '1:949608325040:ios:89660d1e835821dc5d8075',
    messagingSenderId: '949608325040',
    projectId: 'fir-sample-1ac6b',
    storageBucket: 'fir-sample-1ac6b.firebasestorage.app',
    iosBundleId: 'com.example.todolistappexm',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDpC44vJWntofL89aR-ASSpCyGzAClJYaY',
    appId: '1:949608325040:web:fcf3389d13202c8c5d8075',
    messagingSenderId: '949608325040',
    projectId: 'fir-sample-1ac6b',
    authDomain: 'fir-sample-1ac6b.firebaseapp.com',
    storageBucket: 'fir-sample-1ac6b.firebasestorage.app',
    measurementId: 'G-9KZ44KTYBV',
  );

}