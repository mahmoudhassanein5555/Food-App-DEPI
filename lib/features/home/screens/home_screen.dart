import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../core/mock_data/mock_data.dart';
import '../../../core/widgets/circle_icon_button.dart';
import '../../../core/widgets/restaurant_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../food_listing/screens/food_listing_screen.dart';
import '../../restaurant/screens/restaurant_view_screen.dart';
import '../../search/screens/search_screen.dart';
import '../../cart/screens/cart_screen.dart';
import '../../orders/screens/orders_screen.dart';
import '../widgets/home_top_bar.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_categories.dart';
import 'package:food_app_depi/core/utils/app_string.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _cartCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            const HomeTopBar(cartCount: 2),
            const SizedBox(height: 20),
            const Row(
              children: [
                Text(
                  AppString.heyHalal,
                  style: TextStyle(fontSize: 20, color: AppColors.textDarkest),
                ),
                Text(
                  AppString.goodAfternoon,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDarkest,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const HomeSearchBar(),
            const SizedBox(height: 24),
            SectionHeader(title: AppString.allCategories, onSeeAll: () {}),
            const SizedBox(height: 12),
            const HomeCategories(),
            const SizedBox(height: 24),
            SectionHeader(title: AppString.openRestaurants, onSeeAll: () {}),
            const SizedBox(height: 12),
            ...mockRestaurants.take(3).map(
                  (r) => Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: RestaurantCard(
                      restaurant: r,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RestaurantViewScreen(restaurant: r),
                        ),
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

}
