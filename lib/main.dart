import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_string.dart';
import 'package:food_app_depi/features/orders/screens/orders_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.foodAppTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryOrange,
          surface: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: 'GoogleSansFlex',
      ),
      home: const OrdersScreen(),
    );
  }
}
