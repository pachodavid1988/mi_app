import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_screen.dart'; // 👈 importa tu pantalla principal

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAyFc7ad_QocuWG-HINW5LAvsNXzxYCyio",
      authDomain: "app-firebase-3a679.firebaseapp.com",
      projectId: "app-firebase-3a679",
      storageBucket: "app-firebase-3a679.firebasestorage.app",
      messagingSenderId: "147597674877",
      appId: "1:147597674877:web:44481465e5be8a4a302414",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ❌ No usar const aquí
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // 👈 pantalla principal
    );
  }
}
