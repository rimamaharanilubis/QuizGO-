import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1A0033);
    const Color accentColor = Color(0xFFDFC045);
    const Color fieldColor = Color(0xFFD9D9D9);

    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final buttonBackgroundColor = _isButtonPressed ? primaryColor : fieldColor;
    const buttonTextColor = accentColor;
    final List<BoxShadow>? buttonShadow = _isButtonPressed
        ? [
      BoxShadow(
        color: const Color(0xFFB388FF).withOpacity(0.9),
        blurRadius: 30,
        spreadRadius: 10,
      ),
    ]
        : null;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: screenHeight * 0.10,
              child: Column(
                children: [
                  const Text(
                    'Selamat Datang di',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: accentColor,
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'QuizGo!',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: accentColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight / 2 - 50,
              child: Column(
                children: [
                  const Text(
                    'Nama:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: accentColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 16),
                        filled: true,
                        fillColor: fieldColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight / 2 + 100,
              child: GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _isButtonPressed = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _isButtonPressed = false;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _isButtonPressed = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: screenWidth * 0.5,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: buttonBackgroundColor,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: buttonShadow,
                    border: _isButtonPressed
                        ? Border.all(color: accentColor.withOpacity(0.5))
                        : null,
                  ),
                  child: const Text(
                    'Mulai',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: buttonTextColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}