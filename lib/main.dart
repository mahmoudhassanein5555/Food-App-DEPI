import 'package:flutter/material.dart';
import 'core/app_colors.dart';
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
        scaffoldBackgroundColor: AppColors.screenBackground,
        fontFamily: 'GoogleSansFlex',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryOrange,
          primary: AppColors.primaryOrange,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
