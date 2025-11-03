import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quisgo/config/app_theme.dart';
import 'package:quisgo/provider/app_state_provider.dart';
import 'package:quisgo/screens/resultscreen.dart'; // Pastikan import ini ada

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  void _handleAnswer(BuildContext context, int selectedIndex) {
    final provider = Provider.of<AppStateProvider>(context, listen: false);
    if (provider.isAnswered) return;

    provider.submitAnswer(selectedIndex);

    Timer(const Duration(seconds: 2), () {
      if (provider.currentQuestionIndex < provider.questions.length - 1) {
        provider.nextQuestion();
      } else {
        // Navigasi ke ResultScreen saat kuis selesai
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ResultScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  // Progress bar
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
                        value: provider.progress,
                        backgroundColor: Colors.transparent,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors
                            .white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),

                  // Teks Pertanyaan
                  Text(
                    '${provider.currentQuestionIndex + 1}. ${currentQuestion
                        .text}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.accent,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),

                  // Pilihan Jawaban
                  ...List.generate(currentQuestion.options.length, (index) {
                    Color? finalGlowColor;
                    bool isFinalSelected = false;

                    if (provider.isAnswered) {
                      bool isCorrectAnswer =
                          index == currentQuestion.correctAnswerIndex;
                      bool isSelectedAnswer =
                          index == provider.selectedAnswerIndex;

                      if (isCorrectAnswer) {
                        finalGlowColor = Colors.greenAccent;
                        isFinalSelected = true;
                      } else if (isSelectedAnswer) {
                        finalGlowColor = Colors.redAccent;
                        isFinalSelected = true;
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: AnswerButton(
                        text: currentQuestion.options[index],
                        isSelected: isFinalSelected,
                        glowColor: finalGlowColor,
                        // Menonaktifkan tombol setelah jawaban diberikan
                        onPressed: provider.isAnswered
                            ? () {}
                            : () => _handleAnswer(context, index),
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

// --- PERUBAHAN UTAMA DI SINI ---
// Mengubah AnswerButton menjadi StatefulWidget
class AnswerButton extends StatefulWidget {
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
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    // Tentukan apakah glow ungu (saat ditekan) harus ditampilkan.
    // Tombol tidak boleh glow ungu jika sudah dievaluasi (isSelected).
    final bool showPressGlow = _isPressed && !widget.isSelected;

    // Tentukan warna latar belakang berdasarkan kondisi.
    final Color bgColor = widget.isSelected
        ? AppColors.primary // Warna saat jawaban dievaluasi (benar/salah).
        : showPressGlow
        ? AppColors.primary // Warna saat ditekan.
        : AppColors.field; // Warna normal.

    // Tentukan warna teks berdasarkan kondisi.
    final Color textColor = widget.isSelected
        ? AppColors.accent // Warna saat jawaban dievaluasi.
        : showPressGlow
        ? AppColors.accent // Warna saat DITEKAN.
        : AppColors.primary; // Warna NORMAL.

    // Tentukan efek shadow (glow) berdasarkan kondisi.
    final List<BoxShadow>? boxShadow = widget.isSelected
        ? [ // Glow untuk jawaban benar/salah.
      BoxShadow(
        color: (widget.glowColor ?? AppColors.glow).withOpacity(0.7),
        blurRadius: 15,
        spreadRadius: 5,
      )
    ]
        : showPressGlow
        ? [ // Glow ungu saat ditekan.
      BoxShadow(
        color: AppColors.glow.withOpacity(0.9),
        blurRadius: 25,
        spreadRadius: 8,
      )
    ]
        : null;

    // Tentukan border untuk jawaban yang sudah dievaluasi.
    final Border? border = widget.isSelected
        ? Border.all(color: widget.glowColor ?? AppColors.glow, width: 2)
        : null;

    return GestureDetector(
      // Menggunakan onTapDown, onTapUp, onTapCancel seperti di CustomButton.
      onTapDown: (_) {
        if (!widget.isSelected) { // Hanya aktifkan jika belum dijawab.
          setState(() => _isPressed = true);
        }
      },
      onTapUp: (_) {
        if (!widget.isSelected) {
          setState(() => _isPressed = false);
          widget.onPressed(); // Panggil fungsi _handleAnswer.
        }
      },
      onTapCancel: () {
        if (!widget.isSelected) {
          setState(() => _isPressed = false);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
          border: border,
          boxShadow: boxShadow,
        ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: AppTextStyles.buttonText(18).copyWith(
            color: AppColors.accent, // Menggunakan textColor yang sudah ditentukan.
          ),
        ),
      ),
    );
  }
}