// This is a STANDALONE preview entry point — use it only to try the
// screens on their own (e.g. rename to main.dart temporarily, or run
// with `flutter run -t lib/main_preview.dart`).
//
// Don't overwrite your team's real main.dart with this — just copy the
// MaterialApp/theme setup you need from here into it.

import 'package:flutter/material.dart';
import 'core/home_ui_colors.dart';
import 'features/home/screens/home_screen.dart';

void main() => runApp(const PreviewApp());

class PreviewApp extends StatelessWidget {
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App Preview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: HomeUiColors.background,
        fontFamily: 'Poppins', // swap for whatever font your team uses
        colorScheme: ColorScheme.fromSeed(
          seedColor: HomeUiColors.primary,
          primary: HomeUiColors.primary,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
