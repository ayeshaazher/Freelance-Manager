import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCK3M-WOq-OZlPQGsYKn-ExhVwDEQ5-JbI",
            authDomain: "task-manager-c429f.firebaseapp.com",
            projectId: "task-manager-c429f",
            storageBucket: "task-manager-c429f.firebasestorage.app",
            messagingSenderId: "796788876351",
            appId: "1:796788876351:web:da5cbc7370b0b40a42048a",
            measurementId: "G-B806PVNB8B"));
  } else {
    await Firebase.initializeApp();
  }
}
