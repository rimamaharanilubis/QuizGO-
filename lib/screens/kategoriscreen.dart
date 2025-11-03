import 'package:flutter/material.dart';
import 'package:quisgo/config/app_theme.dart'; // Import file tema
import 'package:quisgo/widgets/custom_button.dart';

class KategoriScreen extends StatefulWidget {
  const KategoriScreen({super.key});

  @override
  State<KategoriScreen> createState() => _KategoriScreenState();
}

class _KategoriScreenState extends State<KategoriScreen> {
  String? _selectedCategory;
  final List<String> categories = [
    'Pengetahuan',
    'Olahraga',
    'Budaya & Sejarah',
    'Logika & Teka-Teki'
  ];

  void _selectCategory(String category) {
    setState(() => _selectedCategory = category);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    // Tidak ada lagi definisi warna di sini
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: screenHeight * 0.12,
              child: const Text(
                  'Pilih Kategori', style: AppTextStyles.pageTitle),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: CustomButton(
                        text: category,
                        width: screenWidth,
                        fontSize: 20,
                        // Ukuran font spesifik untuk tombol kategori
                        isSelected: _selectedCategory == category,
                        onPressed: () => _selectCategory(category),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}