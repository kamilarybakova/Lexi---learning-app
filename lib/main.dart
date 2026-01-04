import 'package:flutter/material.dart';

import 'features/home/home_screen.dart';

void main() {
  runApp(const LexiApp());
}

class LexiApp extends StatelessWidget {
  const LexiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lexi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0E0F14),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF7C7CFF),
          secondary: Color(0xFFA5A5FF),
          background: Color(0xFF0E0F14),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
