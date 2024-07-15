import 'package:flutter/material.dart';
import 'package:translation_app/screens/home_screen/home_screen.dart';

void main() {
  runApp(const TranslationApp());
}

class TranslationApp extends StatelessWidget {
  const TranslationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Translation App',
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      //initialRoute: Routes.initial,
      home: const HomeScreen(),
      //home: const SplashScreen(),
    );
  }
}
