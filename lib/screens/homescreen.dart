import 'package:flutter/material.dart';
import 'package:quisgo/config/app_theme.dart'; // Import file tema
import 'package:quisgo/widgets/custom_button.dart';
import 'kategoriscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    // Tidak ada lagi definisi warna di sini
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: screenHeight * 0.10,
              child: const Column(
                children: [
                  Text('Selamat Datang di', style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.accent,
                      fontSize: 36,
                      fontWeight: FontWeight.w500)),
                  Text('QuizGo!', style: AppTextStyles.bigTitle),
                ],
              ),
            ),
            Positioned(
              top: screenHeight / 2 - 50,
              child: Column(
                children: [
                  const Text('Nama:', style: TextStyle(fontFamily: 'Montserrat',
                      color: AppColors.accent,
                      fontSize: 28,
                      fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: TextField(
                      controller: _nameController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16),
                        filled: true,
                        fillColor: AppColors.field,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight / 2 + 100,
              child: CustomButton(
                text: 'Mulai',
                width: screenWidth * 0.5,
                fontSize: 35, // Ukuran font spesifik untuk tombol ini
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const KategoriScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}