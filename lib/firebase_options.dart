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
    apiKey: 'AIzaSyC__CjcdhNr7X-k82oK9T_-GwKU7peocWA',
    appId: '1:711588103735:web:3b62838106b30e060621b2',
    messagingSenderId: '711588103735',
    projectId: 'translate-language-c5064',
    authDomain: 'translate-language-c5064.firebaseapp.com',
    storageBucket: 'translate-language-c5064.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCf30JxrGgvLUyfYABhBmMF7Y4f4SW2BJI',
    appId: '1:711588103735:android:f6518e1819c074e40621b2',
    messagingSenderId: '711588103735',
    projectId: 'translate-language-c5064',
    storageBucket: 'translate-language-c5064.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZMmDW1oSdOn-XwZtTkTPvzcMG2ryuszI',
    appId: '1:711588103735:ios:40eb2d6971381de30621b2',
    messagingSenderId: '711588103735',
    projectId: 'translate-language-c5064',
    storageBucket: 'translate-language-c5064.appspot.com',
    androidClientId: '711588103735-na7tpl6rnmmpmirhni4g8gaq0gu5bcns.apps.googleusercontent.com',
    iosClientId: '711588103735-hlovrfu53a7eb84g8gfjlu1phjtarhbd.apps.googleusercontent.com',
    iosBundleId: 'com.example.languageTranslate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZMmDW1oSdOn-XwZtTkTPvzcMG2ryuszI',
    appId: '1:711588103735:ios:9e62f30e5b7bceb70621b2',
    messagingSenderId: '711588103735',
    projectId: 'translate-language-c5064',
    storageBucket: 'translate-language-c5064.appspot.com',
    androidClientId: '711588103735-na7tpl6rnmmpmirhni4g8gaq0gu5bcns.apps.googleusercontent.com',
    iosClientId: '711588103735-3loe6rnnd8h35stdjuq6t3hg3p9akt9g.apps.googleusercontent.com',
    iosBundleId: 'com.example.languageTranslate.RunnerTests',
  );
}
