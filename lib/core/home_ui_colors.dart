import 'package:flutter/material.dart';

class HomeUiColors {
  HomeUiColors._(); 

  static const Color primary = Color(0xFFFF7622);

  static const Color primaryLight = Color(0xFFF58D1D);

 
  static const Color primaryDark = Color(0xFF181C2E);

  static const Color textPrimary = Color(0xFF434755);


  static const Color textSecondary = Color(0xFFA0A5BA);

  static const Color textMuted = Color(0xFF9FA5C0);


  static const Color textOnPrimary = Color(0xFFFFFFFF);


  static const Color background = Color(0xFFF3F3F3);

  static const Color surface = Color(0xFFFFFFFF);

  static const Color imagePlaceholder = Color(0xFF98A8B8);

  static const Color chipUnselectedBg = Color(0xFFF0F5FA);

  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFECECEC);

  static const Color favorite = Color(0xFFFF8400);

  static const Color locationPin = Color(0xFFD30A12);

  static const Color rating = Color(0xFFFF7622);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFFF7622), Color(0xFFF58D1D)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
