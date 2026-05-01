import 'package:flutter/material.dart';
import 'home_screen.dart'; // 👈 importa tu pantalla principal

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(), // 👈 aquí va tu pantalla principal
    );
  }
}
