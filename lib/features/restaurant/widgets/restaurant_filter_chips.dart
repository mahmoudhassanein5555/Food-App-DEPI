import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/mock_data.dart';

class RestaurantFilterChips extends StatefulWidget {
  const RestaurantFilterChips({super.key});

  @override
  State<RestaurantFilterChips> createState() => _RestaurantFilterChipsState();
}

class _RestaurantFilterChipsState extends State<RestaurantFilterChips> {
  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: foodFilterTags.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final selected = index == _selectedFilterIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedFilterIndex = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? AppColors.orange : AppColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: selected
                        ? AppColors.orange
                        : AppColors.borderGray),
              ),
              child: Text(
                foodFilterTags[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : AppColors.textDarkest,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
