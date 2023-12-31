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
    apiKey: 'AIzaSyD0q7f4IqmBaBJJZPiWUh73pI-60JqtbVk',
    appId: '1:555507780838:web:175aba5158577f8bfebf27',
    messagingSenderId: '555507780838',
    projectId: 'projeto-pdm-a34a1',
    authDomain: 'projeto-pdm-a34a1.firebaseapp.com',
    databaseURL: 'https://projeto-pdm-a34a1-default-rtdb.firebaseio.com',
    storageBucket: 'projeto-pdm-a34a1.appspot.com',
    measurementId: 'G-9F8E6PWT6P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdrlKNngUao5unpsPljflOMy7Z4CIbkiU',
    appId: '1:555507780838:android:76f551fed981d97ffebf27',
    messagingSenderId: '555507780838',
    projectId: 'projeto-pdm-a34a1',
    databaseURL: 'https://projeto-pdm-a34a1-default-rtdb.firebaseio.com',
    storageBucket: 'projeto-pdm-a34a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9ZtBIQ_4ultle6Pz-quHUbKvpQv3PjiM',
    appId: '1:555507780838:ios:29b18d2532884bd6febf27',
    messagingSenderId: '555507780838',
    projectId: 'projeto-pdm-a34a1',
    databaseURL: 'https://projeto-pdm-a34a1-default-rtdb.firebaseio.com',
    storageBucket: 'projeto-pdm-a34a1.appspot.com',
    iosBundleId: 'com.example.projetoPdm',
  );
}
