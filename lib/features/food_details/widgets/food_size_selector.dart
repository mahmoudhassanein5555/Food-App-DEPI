import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';

class FoodSizeSelector extends StatefulWidget {
  const FoodSizeSelector({super.key});

  @override
  State<FoodSizeSelector> createState() => _FoodSizeSelectorState();
}

class _FoodSizeSelectorState extends State<FoodSizeSelector> {
  static const _sizes = ['10"', '14"', '16"'];
  int _selectedSizeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_sizes.length, (index) {
        final selected = index == _selectedSizeIndex;
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () => setState(() => _selectedSizeIndex = index),
            child: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    selected ? AppColors.primaryOrangeDark : AppColors.softBlue,
              ),
              child: Text(
                _sizes[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: selected ? Colors.white : AppColors.muted,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
