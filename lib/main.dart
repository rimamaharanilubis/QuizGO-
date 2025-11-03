import 'package:flutter/material.dart';
import 'package:quisgo/screens/splashscreen.dart'; // Impor SplashScreen

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
        primarySwatch: Colors.purple,
        //Menetapkan font default untuk seluruh aplikasi
        fontFamily: 'Montserrat',
      ),
      //Menonaktifkan banner "Debug"
      debugShowCheckedModeBanner: false,
      //SplashScreen sebagai halaman pertama yang muncul
      home: const SplashScreen(),
    );
  }
}