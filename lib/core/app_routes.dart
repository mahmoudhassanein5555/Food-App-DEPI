import 'package:flutter/material.dart';
import 'package:food_app_depi/core/models/address_model.dart';
import 'package:food_app_depi/features/profile/add_edit_address_screen.dart';
import 'package:food_app_depi/features/profile/address_list_screen.dart';
import 'package:food_app_depi/features/profile/edit_profile_screen.dart';
import 'package:food_app_depi/features/profile/personal_info_screen.dart';
import 'package:food_app_depi/features/profile/profile_screen.dart';

/// Every screen in the app gets a route name here. This is the single place
/// that wires screens together: anyone (a teammate's Home/Cart screen, the
/// bottom nav bar, etc.) can navigate into the Profile flow just by calling
/// `Navigator.pushNamed(context, AppRoutes.profile)` — no need to import the
/// screen file directly.
class AppRoutes {
  const AppRoutes._();

  static const String profile = '/profile';
  static const String personalInfo = '/profile/personal-info';
  static const String editProfile = '/profile/edit';
  static const String addressList = '/profile/addresses';
  static const String addEditAddress = '/profile/addresses/edit';

  /// Register this map on `MaterialApp(routes: AppRoutes.table)`, and merge
  /// it with the routes your teammates add for Home, Search, Cart, etc.
  static Map<String, WidgetBuilder> get table => {
        profile: (_) => const ProfileScreen(),
        personalInfo: (_) => const PersonalInfoScreen(),
        addressList: (_) => const AddressListScreen(),
      };

  /// Screens that need to receive arguments (the edit-profile data map, or
  /// an [AddressModel] to edit) can't go in the simple `routes` table above,
  /// so they're resolved here instead. Register this on
  /// `MaterialApp(onGenerateRoute: AppRoutes.onGenerateRoute)`.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case editProfile:
        final data = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => EditProfileScreen(initialData: data),
        );
      case addEditAddress:
        final existing = settings.arguments as AddressModel?;
        return MaterialPageRoute(
          builder: (_) => AddEditAddressScreen(existing: existing),
        );
      default:
        return null;
    }
  }
}
