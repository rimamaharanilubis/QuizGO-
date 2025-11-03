import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quisgo/screens/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1A0033);
    const Color accentColor = Color(0xFFDFC045);

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(0.98),
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
                    fontWeight: FontWeight.w900,
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
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}