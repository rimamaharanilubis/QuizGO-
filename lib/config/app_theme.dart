import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1A0033);
  static const Color accent = Color(0xFFDFC045);
  static const Color field = Color(0xFFD9D9D9);
  static const Color glow = Color(0xFFB388FF);
  static const Color border = Colors.blue;
}

class AppTextStyles {
  static const String fontFamily = 'Montserrat';
  static const TextStyle bigTitle = TextStyle(
    fontFamily: fontFamily,
    color: AppColors.accent,
    fontSize: 40,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle pageTitle = TextStyle(
    fontFamily: fontFamily,
    color: AppColors.accent,
    fontSize: 34,
    fontWeight: FontWeight.w500,
  );
  static TextStyle buttonText(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      color: AppColors.primary,
      fontSize: size,
      fontWeight: FontWeight.w700,
    );
  }
}