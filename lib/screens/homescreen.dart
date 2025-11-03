import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quisgo/config/app_theme.dart';
import 'package:quisgo/widgets/custom_button.dart';
import '../provider/app_state_provider.dart';
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
                fontSize: 35,
                onPressed: () {
                  if (_nameController.text.isNotEmpty) {
                    final appProvider = context.read<AppStateProvider>();
                    appProvider.setUserName(_nameController.text);
                  }
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