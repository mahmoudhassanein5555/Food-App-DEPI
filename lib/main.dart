import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_routes.dart';
import 'package:food_app_depi/core/app_string.dart';
import 'package:food_app_depi/features/profile/profile_screen.dart';

void
main() {
  runApp(
    const MyApp(),
  );
}

class MyApp
    extends
        StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: AppString.foodAppTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryOrange,
          surface: AppColors.white,
        ),
        fontFamily: 'GoogleSansFlex',
      ),
      home: const ProfileScreen(),
      routes: AppRoutes.table,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
