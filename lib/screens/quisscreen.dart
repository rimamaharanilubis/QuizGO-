import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quisgo/config/app_theme.dart';
import 'package:quisgo/provider/app_state_provider.dart';

class QuizScreen extends StatefulWidget {
  // Tidak perlu lagi menerima kategori di sini, karena provider yang akan mengaturnya.
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    // Pindahkan logika `startQuiz` ke sini jika diperlukan,
    // tapi lebih baik dipanggil saat navigasi dari KategoriScreen.
  }

  void _handleAnswer(BuildContext context, int selectedIndex) {
    final provider = Provider.of<AppStateProvider>(context, listen: false);
    if (provider.isAnswered) return; // Jangan biarkan jawaban diubah

    // 1. Kirim jawaban ke provider
    provider.submitAnswer(selectedIndex);

    // 2. Otomatis pindah ke soal berikutnya setelah beberapa saat
    Timer(const Duration(seconds: 2), () {
      // Cek apakah kuis sudah selesai
      if (provider.currentQuestionIndex < provider.questions.length - 1) {
        provider.nextQuestion();
      } else {
        // TODO: Navigasi ke halaman hasil/skor
        print("Kuis Selesai! Skor Akhir: ${provider.score}");
        Navigator.pop(context); // Kembali ke halaman kategori untuk sementara
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Gunakan Consumer atau context.watch untuk mendapatkan state dari provider
    return Consumer<AppStateProvider>(
      builder: (context, provider, child) {
        if (provider.questions.isEmpty) {
          return Scaffold(
            backgroundColor: AppColors.primary,
            body: Center(
              child: Text(
                "Memuat soal...",
                style: AppTextStyles.pageTitle.copyWith(fontSize: 20),
              ),
            ),
          );
        }

        final currentQuestion = provider.currentQuestion!;

        return Scaffold(
          backgroundColor: AppColors.primary,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 1. Progress Bar (menggunakan data dari provider)
                  Container(
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.glow.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: provider.progress, // <-- Data dari provider
                        backgroundColor: Colors.transparent,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors
                            .white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),

                  // 2. Teks Pertanyaan (menggunakan data dari provider)
                  Text(
                    '${provider.currentQuestionIndex + 1}. ${currentQuestion
                        .text}', // <-- Data dari provider
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.accent,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),

                  // 3. Pilihan Jawaban (menggunakan data dari provider)
                  ...List.generate(currentQuestion.options.length, (index) {
                    Color? glowColor;
                    bool isSelectedForUI = false;

                    if (provider.isAnswered) {
                      bool isCorrectAnswer = index ==
                          currentQuestion.correctAnswerIndex;
                      bool isSelectedAnswer = index ==
                          provider.selectedAnswerIndex;

                      if (isCorrectAnswer) {
                        glowColor = Colors.greenAccent;
                        isSelectedForUI = true;
                      } else if (isSelectedAnswer) {
                        glowColor = Colors.redAccent;
                        isSelectedForUI = true;
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: AnswerButton(
                        text: currentQuestion.options[index],
                        isSelected: isSelectedForUI,
                        glowColor: glowColor,
                        onPressed: () => _handleAnswer(context, index),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Widget AnswerButton tidak perlu diubah, tapi saya sertakan lagi untuk kelengkapan
class AnswerButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Color? glowColor;
  final VoidCallback onPressed;

  const AnswerButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
    this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.field,
          borderRadius: BorderRadius.circular(30),
          border: isSelected ? Border.all(
              color: glowColor ?? AppColors.glow, width: 2) : null,
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: (glowColor ?? AppColors.glow).withOpacity(0.7),
              blurRadius: 15,
              spreadRadius: 5,
            )
          ]
              : null,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.buttonText(18).copyWith(
            color: isSelected ? AppColors.accent : AppColors.primary,
          ),
        ),
      ),
    );
  }
}