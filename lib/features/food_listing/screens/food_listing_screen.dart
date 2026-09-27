import 'package:flutter/material.dart';
import '../../../core/home_ui_colors.dart';
import '../../../core/app_icons.dart';
import '../../../core/mock_data.dart';
import '../../../core/widgets/circle_icon_button.dart';
import '../../../core/widgets/food_item_card.dart';
import '../../../core/widgets/restaurant_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../food_details/screens/food_details_screen.dart';
import '../../restaurant/screens/restaurant_view_screen.dart';

/// Listing screen for a food category (design shows "Food - Burgers").
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
      backgroundColor: HomeUiColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            _buildTopBar(context),
            const SizedBox(height: 20),
            SectionHeader(title: 'Popular Burgers', onSeeAll: () {}),
            const SizedBox(height: 14),
            _buildBurgerGrid(context),
            const SizedBox(height: 24),
            SectionHeader(title: 'Open Restaurants', onSeeAll: () {}),
            const SizedBox(height: 14),
            RestaurantCard(
              restaurant: mockRestaurants[1],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RestaurantViewScreen(restaurant: mockRestaurants[1]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      children: [
        CircleIconButton(icon: AppIcons.back, onTap: () => Navigator.pop(context)),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: HomeUiColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: HomeUiColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.categoryName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: HomeUiColors.textPrimary,
                  ),
                ),
                const Icon(AppIcons.dropdownChevron, size: 16, color: HomeUiColors.textPrimary),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        const CircleIconButton(
          icon: AppIcons.search,
          backgroundColor: HomeUiColors.primaryDark,
          size: 40,
        ),
        const SizedBox(width: 8),
        const CircleIconButton(
          icon: AppIcons.filterGrid,
          backgroundColor: HomeUiColors.primaryDark,
          size: 40,
        ),
      ],
    );
  }

  Widget _buildBurgerGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mockBurgers.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) {
        final item = mockBurgers[index];
        return FoodItemCard(
          item: item,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => FoodDetailsScreen(item: item)),
          ),
          onAdd: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Added ${item.name} to cart')),
          ),
        );
      },
    );
  }
}
