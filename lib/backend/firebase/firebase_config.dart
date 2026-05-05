import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../../firebase_options.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDxgJcmhd3nD_so5A7fyBVWMDxe-DMYhyM",
            authDomain: "ayeshwebsite-f0494.firebaseapp.com",
            projectId: "ayeshwebsite-f0494",
            storageBucket: "ayeshwebsite-f0494.firebasestorage.app",
            messagingSenderId: "882112364789",
            appId: "1:882112364789:web:9ea97dd0e45eb38926c5bc"));
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
