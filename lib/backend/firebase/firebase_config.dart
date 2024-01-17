import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBF3Ix0E0rSsDAKhgXGTK-WloOVOBFSHtw",
            authDomain: "gambling-seocn4.firebaseapp.com",
            projectId: "gambling-seocn4",
            storageBucket: "gambling-seocn4.appspot.com",
            messagingSenderId: "932755574962",
            appId: "1:932755574962:web:a830c8b7267f1239beb9ab"));
  } else {
    await Firebase.initializeApp();
  }
}
