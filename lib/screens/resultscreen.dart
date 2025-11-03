import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quisgo/config/app_theme.dart';
import 'package:quisgo/provider/app_state_provider.dart';
import 'package:quisgo/widgets/custom_button.dart';
import 'reviewscreen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppStateProvider>(context, listen: false);
    final userName = provider.userName.isNotEmpty ? provider.userName : "User";
    final score = provider.score;
    final totalQuestions = provider.questions.length;
    final finalScore =
    totalQuestions > 0 ? (score * 100 / totalQuestions).round() : 0;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat, $userName!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: AppColors.accent,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 80),

                const Text(
                  'Skor Kamu:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: AppColors.accent,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '$finalScore/100',
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: AppColors.accent,
                    fontSize: 80,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 80),

                CustomButton(
                  text: "Lihat Jawaban\nYang Benar",
                  fontSize: 36,
                  width: 304,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReviewScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),

                CustomButton(
                  text: "Coba Lagi",
                  fontSize: 36,
                  width: 200,
                  onPressed: () {
                    int count = 0;
                    Navigator.popUntil(context, (route) {
                      return count++ == 2;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}