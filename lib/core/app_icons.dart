// Icon set used across the app, based on Iconsax
// (matches the outline/two-tone style used in the design screenshots).
//
// 1) Add the package in pubspec.yaml:
//      dependencies:
//        iconsax_flutter: ^1.0.0
//
// If you'd rather not add a package, every icon below has a Material
// fallback noted in the comment — swap `Iconsax.x` for `Icons.x` fast.

import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter/widgets.dart';

class AppIcons {
  AppIcons._();

  // ==================== HOME SCREEN ====================
  static const IconData menu = Iconsax.menu; // Icons.menu
  static const IconData locationDropdown = Iconsax.arrow_down_1; // Icons.keyboard_arrow_down
  static const IconData cart = Iconsax.shopping_bag; // Icons.shopping_bag_outlined
  static const IconData search = Iconsax.search_normal_1; // Icons.search
  static const IconData star = Iconsax.star; // Icons.star (filled)
  static const IconData delivery = Iconsax.truck_fast; // Icons.local_shipping_outlined
  static const IconData clock = Iconsax.clock; // Icons.access_time

  // ==================== SEARCH SCREEN ====================
  static const IconData back = Iconsax.arrow_left_2; // Icons.arrow_back_ios_new
  static const IconData clearInput = Iconsax.close_circle; // Icons.cancel
  static const IconData keywordTag = Iconsax.tag; // Icons.local_offer_outlined

  // ==================== FOOD - BURGERS (LISTING) ====================
  static const IconData dropdownChevron = Iconsax.arrow_down_1; // Icons.expand_more
  static const IconData filterGrid = Iconsax.category; // Icons.grid_view
  static const IconData addButton = Iconsax.add; // Icons.add
  static const IconData minusButton = Iconsax.minus; // Icons.remove

  // ==================== FOOD DETAILS ====================
  static const IconData favoriteOutline = Iconsax.heart; // Icons.favorite_border
  static const IconData favoriteFilled = Iconsax.heart; // Icons.favorite
  static const IconData location = Iconsax.location; // Icons.location_on
  static const IconData ingredientAllergen = Iconsax.warning_2; // Icons.warning_amber (placeholder per ingredient)

  // ==================== RESTAURANT VIEW ====================
  static const IconData moreOptions = Iconsax.more; // Icons.more_horiz
}
