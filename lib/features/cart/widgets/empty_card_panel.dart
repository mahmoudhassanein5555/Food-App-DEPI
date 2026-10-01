import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_string.dart';
import 'package:food_app_depi/features/cart/widgets/card_illustration.dart';

class EmptyCardPanel extends StatelessWidget {
  const EmptyCardPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 14),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const CardIllustration(),
          const SizedBox(height: 14),
          const Text(
            AppString.noMastercardAdded,
            style: TextStyle(color: AppColors.textPrimary, fontSize: 13),
          ),
          const SizedBox(height: 4),
          const Text(
            AppString.addMastercardDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textSecondary,
              height: 1.45,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
