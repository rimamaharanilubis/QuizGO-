import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quisgo/config/app_theme.dart';
import 'package:quisgo/provider/app_state_provider.dart';
import 'package:quisgo/screens/resultscreen.dart';

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
                        backgroundColor: Colors.white,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),

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

                  ...List.generate(currentQuestion.options.length, (index) {
                    bool isSelected = provider.isAnswered &&
                        provider.selectedAnswerIndex == index;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: AnswerButton(
                        text: currentQuestion.options[index],
                        isSelected: isSelected,
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

class AnswerButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  const AnswerButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final bool showGlow = _isPressed || widget.isSelected;
    final Color bgColor = showGlow ? AppColors.primary : AppColors.field;
    const Color textColor = AppColors.accent;
    final List<BoxShadow>? boxShadow = showGlow
        ? [
      BoxShadow(
        color: AppColors.glow.withOpacity(0.9),
        blurRadius: 25,
        spreadRadius: 8,
      )
    ]
        : null;
    final Border? border = widget.isSelected
        ? Border.all(color: AppColors.glow, width: 2)
        : null;

    return GestureDetector(
      onTapDown: (_) {
        if (!widget.isSelected) {
          setState(() => _isPressed = true);
        }
      },
      onTapUp: (_) {
        if (!widget.isSelected) {
          setState(() => _isPressed = false);
          widget.onPressed();
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
            color: textColor,
          ),
        ),
      ),
    );
  }
}