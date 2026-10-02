import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/widgets/app_svg_icon.dart';
import 'package:food_app_depi/core/widgets/circle_icon_button.dart';

class FoodListingTopBar extends StatelessWidget {
  final String categoryName;

  const FoodListingTopBar({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIconButton(icon: 'assets/icons/arrow_left.svg', iconColor: AppColors.black, backgroundColor: AppColors.borderGray, onTap: () => Navigator.pop(context)),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.borderGray),
            ),
            child: Row(
              children: [
                Text(
                  categoryName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDarkest,
                  ),
                ),
                const AppSvgIcon('assets/icons/dropdown_triangle.svg', size: 8, color: AppColors.orange),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        const CircleIconButton(
          icon: 'assets/icons/search.svg',
          backgroundColor: AppColors.textDarkest,
          size: 40,
        ),
        const SizedBox(width: 8),
        const CircleIconButton(
          icon: 'assets/icons/category.svg',
          backgroundColor: AppColors.textDarkest,
          size: 40,
        ),
      ],
    );
  }
}
