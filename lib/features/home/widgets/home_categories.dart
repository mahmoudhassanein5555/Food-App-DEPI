import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/mock_data.dart';
import 'package:food_app_depi/features/food_listing/screens/food_listing_screen.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final visibleCategories = mockCategories
        .where(
          (category) => category.name == 'Pizza' || category.name == 'Burger',
        )
        .take(3)
        .toList();

    return SizedBox(
      height: 92,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: visibleCategories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final category = visibleCategories[index];

          return GestureDetector(
            onTap: category.name == 'Burger'
                ? () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FoodListingScreen(categoryName: category.name),
                      ),
                    )
                : null,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    category.imageUrl,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDarkest,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
