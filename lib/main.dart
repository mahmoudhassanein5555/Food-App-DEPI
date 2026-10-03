import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/utils/app_routes.dart';
import 'package:food_app_depi/features/home/screens/main_layout_screen.dart';
import 'package:food_app_depi/features/splash/splash_screen.dart';

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
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.orange,
        ),
      ),
      home: SplashScreen(),
      routes: AppRoutes.table,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
