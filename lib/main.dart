import 'package:flutter/material.dart';
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
        scaffoldBackgroundColor: const Color(0xFF121223),
        fontFamily: 'Sen',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF7622)),
      ),
      home: const SplashScreen(),
    );
  }
}