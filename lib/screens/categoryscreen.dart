import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quisgo/config/app_theme.dart';
import 'package:quisgo/widgets/custom_button.dart';
import '../provider/app_state_provider.dart';
import 'quizscreen.dart';

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
    print("Kategori dipilih: $category");

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizScreen(),
          ),
        ).then((_) {
          setState(() {
            _selectedCategory = null;
          });
        });
      }
    });
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

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: screenHeight * 0.12,
              child:
              const Text('Pilih Kategori', style: AppTextStyles.pageTitle),
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
                        onPressed: () {
                          _selectCategory(category);
                          final appProvider = context.read<AppStateProvider>();
                          appProvider.startQuiz(category);
                        },
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