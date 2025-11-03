import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quisgo/config/app_theme.dart';
import 'package:quisgo/screens/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _fadeAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: AppColors.accent.withOpacity(0.8),
                        blurRadius: 20.0,
                        spreadRadius: 5.0),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 90,
                  backgroundColor: AppColors.primary,
                  child: Text("Q", style: TextStyle(fontFamily: 'Montserrat',
                      color: AppColors.accent,
                      fontSize: 128,
                      fontWeight: FontWeight.w900)),
                ),
              ),
              const SizedBox(height: 25),
              const Text("QuizGO!", style: TextStyle(fontFamily: 'Montserrat',
                  color: AppColors.accent,
                  fontSize: 68,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5)),
            ],
          ),
        ),
      ),
    );
  }
}