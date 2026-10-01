
import 'package:flutter/material.dart';

import 'core/app_colors.dart';
import 'features/splash/splash_screen.dart';

void main() {
  runApp(const FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'GoogleSansFlex',
        scaffoldBackgroundColor: const Color(0xFF121223),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryOrange,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
