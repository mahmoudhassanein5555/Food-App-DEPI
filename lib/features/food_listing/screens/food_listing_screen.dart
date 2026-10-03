import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/mock_data/mock_data.dart';
import '../../../core/widgets/restaurant_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../restaurant/screens/restaurant_view_screen.dart';
import '../widgets/food_listing_top_bar.dart';
import '../widgets/food_listing_grid.dart';
import 'package:food_app_depi/core/utils/app_string.dart';

class FoodListingScreen extends StatefulWidget {
  final String categoryName;

  const FoodListingScreen({super.key, required this.categoryName});

  @override
  State<FoodListingScreen> createState() => _FoodListingScreenState();
}

class _FoodListingScreenState extends State<FoodListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            FoodListingTopBar(categoryName: widget.categoryName),
            const SizedBox(height: 20),
            const SectionHeader(title: AppString.popularBurgers),
            const SizedBox(height: 14),
            const FoodListingGrid(),
            const SizedBox(height: 24),
            const SectionHeader(title: AppString.openRestaurants),
            const SizedBox(height: 14),
            RestaurantCard(
              restaurant: mockRestaurants[1],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      RestaurantViewScreen(restaurant: mockRestaurants[1]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
