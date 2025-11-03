import 'package:flutter/material.dart';

// --- PUSAT KENDALI WARNA APLIKASI ---
class AppColors {
  static const Color primary = Color(0xFF1A0033); // Ungu tua
  static const Color accent = Color(0xFFDFC045); // Emas/Kuning
  static const Color field = Color(0xFFD9D9D9); // Abu-abu muda
  static const Color glow = Color(0xFFB388FF); // Ungu terang (untuk glow)
  static const Color border = Colors.blue; // Biru (untuk border pilihan)
}

// --- PUSAT KENDALI GAYA TEKS APLIKASI ---
class AppTextStyles {
  static const String fontFamily = 'Montserrat';

  // Gaya teks untuk judul besar di Splash & Home
  static const TextStyle bigTitle = TextStyle(
    fontFamily: fontFamily,
    color: AppColors.accent,
    fontSize: 40,
    fontWeight: FontWeight.w900,
  );

  // Gaya teks untuk judul halaman (seperti "Pilih Kategori")
  static const TextStyle pageTitle = TextStyle(
    fontFamily: fontFamily,
    color: AppColors.accent,
    fontSize: 34,
    fontWeight: FontWeight.w500, // Tidak bold
  );

  // Gaya teks untuk tombol
  static TextStyle buttonText(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      color: AppColors.primary,
      fontSize: size,
      fontWeight: FontWeight.w700,
    );
  }
}