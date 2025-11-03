import 'package:flutter/material.dart';
import 'package:quisgo/data/quis_data.dart';
import 'package:quisgo/models/question_model.dart';

class AppStateProvider extends ChangeNotifier {
  String _userName = '';
  String _selectedCategory = '';
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _isAnswered = false;

  Map<int, int> _userAnswers = {};

  String get userName => _userName;

  String get selectedCategory => _selectedCategory;

  List<Question> get questions => _questions;

  int get currentQuestionIndex => _currentQuestionIndex;

  int get score => _score;

  Question? get currentQuestion =>
      _questions.isNotEmpty ? _questions[_currentQuestionIndex] : null;

  int? get selectedAnswerIndex => _selectedAnswerIndex;

  bool get isAnswered => _isAnswered;

  Map<int, int> get userAnswers => _userAnswers;

  double get progress =>
      _questions.isEmpty ? 0 : (_currentQuestionIndex + 1) / _questions.length;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void startQuiz(String category) {
    _selectedCategory = category;
    _questions = List<Question>.from(quizData[category] ?? []);
    _questions.shuffle();
    _currentQuestionIndex = 0;
    _score = 0;
    _isAnswered = false;
    _selectedAnswerIndex = null;
    _userAnswers = {};
    notifyListeners();
  }

  void submitAnswer(int answerIndex) {
    if (_isAnswered) return;

    _selectedAnswerIndex = answerIndex;
    _isAnswered = true;
    _userAnswers[_currentQuestionIndex] = answerIndex;

    if (answerIndex == currentQuestion?.correctAnswerIndex) {
      _score++;
    }
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _isAnswered = false;
      _selectedAnswerIndex = null;
      notifyListeners();
    } else {
      print("Kuis Selesai! Skor Akhir: $_score");
    }
  }

  void resetQuiz() {
    _selectedCategory = '';
    _questions = [];
    _currentQuestionIndex = 0;
    _score = 0;
    _isAnswered = false;
    _selectedAnswerIndex = null;
    _userAnswers = {};
    notifyListeners();
  }
}