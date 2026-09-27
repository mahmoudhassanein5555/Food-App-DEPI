import 'package:flutter/material.dart';

/// UI-kit color palette for the Home/Search/Food/Restaurant screens.
/// Kept SEPARATE from core/app_colors.dart (the team's existing file)
/// to avoid any name clash — these two files can coexist safely.
///
/// App color palette — extracted directly from the design screenshots
/// (Home, Search, Food-Burgers, Food Details, Restaurant View).
class HomeUiColors {
  HomeUiColors._(); // prevent instantiation

  // ==================== PRIMARY ====================
  /// Main brand orange — used for CTA buttons ("ADD TO CART"), prices,
  /// notification badges, active states, star rating fill.
  static const Color primary = Color(0xFFFF7622);

  /// Slightly lighter orange used on selected chips/size selectors
  /// (e.g. the "14"" size circle, selected category chip).
  static const Color primaryLight = Color(0xFFF58D1D);

  /// Dark navy — used as background for circular icon buttons
  /// (menu icon, cart icon, back button on light backgrounds).
  static const Color primaryDark = Color(0xFF181C2E);

  // ==================== TEXT ====================
  /// Headings & titles (e.g. "Rose Garden Restaurant", "Burger Bistro").
  static const Color textPrimary = Color(0xFF434755);

  /// Body / description text (e.g. paragraph under "Burger Bistro").
  static const Color textSecondary = Color(0xFFA0A5BA);

  /// Subtitles / tags under titles (e.g. "Burger - Chiken - Riche - Wings").
  static const Color textMuted = Color(0xFF9FA5C0);

  /// Text/icons placed on the primary orange or dark backgrounds.
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ==================== BACKGROUNDS ====================
  /// Screen / scaffold background.
  static const Color background = Color(0xFFF3F3F3);

  /// Cards, sheets, bottom bars.
  static const Color surface = Color(0xFFFFFFFF);

  /// Placeholder box for dish/restaurant images before they load.
  static const Color imagePlaceholder = Color(0xFF98A8B8);

  /// Background for unselected size/option circles (e.g. "10"", "16"").
  static const Color chipUnselectedBg = Color(0xFFF0F5FA);

  // ==================== BORDERS / DIVIDERS ====================
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFECECEC);

  // ==================== SEMANTIC ====================
  /// Favorite / heart icon.
  static const Color favorite = Color(0xFFFF8400);

  /// Location pin (restaurant address marker).
  static const Color locationPin = Color(0xFFD30A12);

  /// Star rating fill (same family as primary orange).
  static const Color rating = Color(0xFFFF7622);

  // ==================== GRADIENTS (optional, handy for buttons) ====
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFFF7622), Color(0xFFF58D1D)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
