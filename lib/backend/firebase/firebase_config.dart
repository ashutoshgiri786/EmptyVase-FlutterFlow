import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBlK1ogF_0MgvmtefUMDrBYoGp0vV32FcQ",
            authDomain: "empty-vase-ff.firebaseapp.com",
            projectId: "empty-vase-ff",
            storageBucket: "empty-vase-ff.appspot.com",
            messagingSenderId: "582933870509",
            appId: "1:582933870509:web:e871c43b8426446d2b5324",
            measurementId: "G-JB6SJ4LJKE"));
  } else {
    await Firebase.initializeApp();
  }
}
