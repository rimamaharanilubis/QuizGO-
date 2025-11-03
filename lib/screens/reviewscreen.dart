import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quisgo/config/app_theme.dart';
import 'package:quisgo/provider/app_state_provider.dart';
import 'package:quisgo/widgets/custom_button.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppStateProvider>(context, listen: false);
    final questions = provider.questions;
    final userAnswers = provider.userAnswers;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: PageView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index];
            final userAnswerIndex = userAnswers[index];
            final correctAnswerIndex = question.correctAnswerIndex;
            final isCorrect = userAnswerIndex == correctAnswerIndex;
            final double progress = (index + 1) / questions.length;

            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.glow.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.white,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),

                  Text(
                    '${index + 1}. ${question.text}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.accent,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 100),

                  AnswerReviewCard(
                    title: 'Jawaban Kamu:',
                    answer: userAnswerIndex != null
                        ? question.options[userAnswerIndex]
                        : "Tidak Dijawab",
                    isCorrect: isCorrect,
                  ),
                  const SizedBox(height: 30),

                  AnswerReviewCard(
                    title: 'Jawaban Benar:',
                    answer: question.options[correctAnswerIndex],
                    isCorrect: true,
                  ),
                  const Spacer(),

                  if (index == questions.length - 1)
                    Center(
                      child: CustomButton(
                        text: "Coba Lagi",
                        fontSize: 32,
                        width: 200,
                        onPressed: () {
                          int count = 0;
                          Navigator.popUntil(context, (route) {
                          return count++ == 3;
                          });
                        },
                      ),
                    ),
                  const Spacer(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class AnswerReviewCard extends StatelessWidget {
  final String title;
  final String answer;
  final bool isCorrect;

  const AnswerReviewCard({
    super.key,
    required this.title,
    required this.answer,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.field,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.buttonText(18).copyWith(
                color: AppColors.accent,
                fontSize: 28),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  answer,
                  style: AppTextStyles.buttonText(22).copyWith(
                      color: AppColors.accent,
                      fontSize: 28,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? Colors.green : Colors.red,
                size: 45,
              ),
            ],
          ),
        ],
      ),
    );
  }
}