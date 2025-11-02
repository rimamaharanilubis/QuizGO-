import 'package:flutter/material.dart';
import 'package:quisgo/screens/splashscreen.dart'; // 1. Impor SplashScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizGO!',
      theme: ThemeData(
        // Tema dasar aplikasi, bisa disesuaikan nanti
        primarySwatch: Colors.purple,
        // Menetapkan font default untuk seluruh aplikasi
        fontFamily: 'Montserrat',
      ),
      // Menonaktifkan banner "Debug" di pojok kanan atas
      debugShowCheckedModeBanner: false,
      // 2. Jadikan SplashScreen sebagai halaman utama (home)
      home: const SplashScreen(),
    );
  }
}