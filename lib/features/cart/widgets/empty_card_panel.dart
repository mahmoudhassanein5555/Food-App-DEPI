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
      child: const Column(
        children: [
          CardIllustration(),
          SizedBox(height: 14),
          Text(
            AppString.noMastercardAdded,
            style: TextStyle(color: AppColors.textDarkest, fontSize: 13),
          ),
          SizedBox(height: 4),
          Text(
            AppString.addMastercardDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.muted,
              height: 1.45,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
