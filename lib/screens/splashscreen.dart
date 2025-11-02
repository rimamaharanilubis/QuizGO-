import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:quisgo/screens/home_screen.dart'; // Ganti dengan halaman tujuan Anda

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Pindah ke halaman lain setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const HomeScreen()), // Ganti dengan halaman utama Anda
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Definisi warna agar mudah diubah dan konsisten
    const Color primaryColor = Color(0xFF1A0033);
    const Color accentColor = Color(0xFFDFC045);

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container untuk membuat efek glow (cahaya)
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(0.85),
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 90,
                backgroundColor: primaryColor,
                child: Text(
                  "Q",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: accentColor,
                    fontSize: 128,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "QuizGO!",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: accentColor,
                fontSize: 68,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}