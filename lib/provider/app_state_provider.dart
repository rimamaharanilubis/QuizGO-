import 'package:flutter/material.dart';
import 'package:quisgo/data/quis_data.dart';
import 'package:quisgo/models/question_model.dart';

class AppStateProvider extends ChangeNotifier {
  // --- Data Pengguna dan Kuis ---
  String _userName = '';
  String _selectedCategory = '';
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;

  // Variabel untuk melacak status jawaban di UI
  int? _selectedAnswerIndex;
  bool _isAnswered = false;

  // --- Getters (untuk mengakses data dari luar) ---
  String get userName => _userName;

  String get selectedCategory => _selectedCategory;

  List<Question> get questions => _questions;

  int get currentQuestionIndex => _currentQuestionIndex;

  int get score => _score;

  Question? get currentQuestion =>
      _questions.isNotEmpty ? _questions[_currentQuestionIndex] : null;

  int? get selectedAnswerIndex => _selectedAnswerIndex;

  bool get isAnswered => _isAnswered;

  double get progress =>
      _questions.isEmpty ? 0 : (_currentQuestionIndex + 1) / _questions.length;

  // --- Setters dan Aksi (untuk mengubah state) ---

  /// Mengatur nama pengguna
  void setUserName(String name) {
    _userName = name;
    notifyListeners(); // Beri tahu widget yang mendengarkan bahwa ada perubahan
  }

  /// Memulai kuis dengan kategori yang dipilih
  void startQuiz(String category) {
    _selectedCategory = category;
    _questions = List<Question>.from(
        quizData[category] ?? []); // Salin daftar soal agar bisa diacak
    _questions.shuffle(); // Acak urutan soal
    _currentQuestionIndex = 0;
    _score = 0;
    _isAnswered = false;
    _selectedAnswerIndex = null;
    notifyListeners();
  }

  /// Menangani logika saat pengguna memilih jawaban
  void submitAnswer(int answerIndex) {
    if (_isAnswered) return; // Mencegah jawaban ganda

    _selectedAnswerIndex = answerIndex;
    _isAnswered = true;

    // Cek apakah jawaban benar dan perbarui skor
    if (answerIndex == currentQuestion?.correctAnswerIndex) {
      _score++;
    }
    notifyListeners();
  }

  /// Pindah ke pertanyaan berikutnya
  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _isAnswered = false;
      _selectedAnswerIndex = null;
      notifyListeners();
    } else {
      // Kuis selesai, bisa ditambahkan logika navigasi ke halaman skor
      print("Kuis Selesai! Skor Akhir: $_score");
    }
  }

  /// Mengatur ulang state kuis ke kondisi awal
  void resetQuiz() {
    _selectedCategory = '';
    _questions = [];
    _currentQuestionIndex = 0;
    _score = 0;
    _isAnswered = false;
    _selectedAnswerIndex = null;
    // _userName tidak di-reset agar tetap ada
    notifyListeners();
  }
}