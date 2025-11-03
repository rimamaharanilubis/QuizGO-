import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quisgo/provider/app_state_provider.dart';
import 'package:quisgo/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppStateProvider(),
      child: MaterialApp(
        title: 'QuizGO!',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          //Menetapkan font default untuk seluruh aplikasi
          fontFamily: 'Montserrat',
        ),
        //Menonaktifkan banner "Debug"
        debugShowCheckedModeBanner: false,
        //SplashScreen sebagai halaman pertama yang muncul
        home: const SplashScreen(),
      ),
    );
  }
}