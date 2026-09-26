import 'package:flutter/material.dart';

/// Exact colors from the Figma file — no approximated/guessed values.
class AppColors {
  const AppColors._();

  static const Color white = Color(0xFFFFFFFF);

  // Text
  static const Color textDark = Color(0xFF32343E); // headings / primary text
  static const Color textDarkest = Color(0xFF181C2E); // highest-contrast text/surfaces
  static const Color textGrey = Color(0xFF747783); // secondary text / labels
  static const Color placeholderGrey = Color(0xFFA0A5BA); // muted icons / disabled

  // Surfaces
  static const Color screenBackground = Color(0xFFF6F8FA);
  static const Color card = Color(0xFFECF0F4);

  // Brand / primary
  static const Color primaryOrange = Color(0xFFFB6F3D); // main CTA buttons
  static const Color secondaryOrange = Color(0xFFFB6D3A); // coral icon accent
  static const Color peach = Color(0xFFFFC6AE); // avatar / image placeholder

  // Accents
  static const Color blue = Color(0xFF369BFF);
  static const Color indigo = Color(0xFF413DFB);
  static const Color teal = Color(0xFF2AE1E1);
  static const Color purple = Color(0xFFB33DFB);
  static const Color amber = Color(0xFFFFAA2A);
  static const Color red = Color(0xFFFB4A59);
}
