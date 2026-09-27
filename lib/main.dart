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
        fontFamily: 'Poppins',
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
