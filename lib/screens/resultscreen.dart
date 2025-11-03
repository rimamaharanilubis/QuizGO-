import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quisgo/config/app_theme.dart';
import 'package:quisgo/provider/app_state_provider.dart';
import 'package:quisgo/widgets/custom_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil data dari provider
    final provider = Provider.of<AppStateProvider>(context, listen: false);
    final userName = provider.userName.isNotEmpty ? provider.userName : "User";
    final score = provider.score;
    final totalQuestions = provider.questions.length;

    // Hitung skor akhir dalam skala 100
    final finalScore = totalQuestions > 0 ? (score * 100 / totalQuestions)
        .round() : 0;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. Ucapan Selamat
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

                // 2. Tampilan Skor
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

                // 3. Tombol "Lihat Jawaban Yang Benar"
                CustomButton(
                  text: "Lihat Jawaban Yang Benar",
                  fontSize: 18,
                  onPressed: () {
                    // TODO: Buat halaman untuk menampilkan daftar jawaban
                    print("Tombol 'Lihat Jawaban' ditekan.");
                  },
                ),
                const SizedBox(height: 20),

                // 4. Tombol "Coba Lagi"
                CustomButton(
                  text: "Coba Lagi",
                  fontSize: 18,
                  onPressed: () {
                    // Kembali ke halaman Kategori (pop dua kali: QuizScreen -> KategoriScreen)
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