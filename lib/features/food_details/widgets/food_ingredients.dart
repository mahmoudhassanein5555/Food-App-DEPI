import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/widgets/app_svg_icon.dart';

class FoodIngredients extends StatelessWidget {
  const FoodIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    const ingredientImages = [
      'assets/icons/category_food_1.svg',
      'assets/icons/category_food_2.svg',
      'assets/icons/category_food_3.svg',
      'assets/icons/category_food_4.svg',
      'assets/icons/category_food_5.svg',
    ];

    return Row(
      children: ingredientImages.map((imagePath) {
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: AppColors.softPink,
              shape: BoxShape.circle,
            ),
            child: AppSvgIcon(
              imagePath,
              size: 40,
              color: AppColors.orange,
            ),
          ),
        );
      }).toList(),
    );
  }
}
