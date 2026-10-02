import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';

class CardIllustration extends StatelessWidget {
  const CardIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 118,
      height: 74,
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 9,
            right: 0,
            child: Container(
              width: 40,
              height: 18,
              color: AppColors.paymentCardRed,
            ),
          ),
          Positioned(
            top: 28,
            left: 7,
            right: 7,
            child: Container(height: 12, color: AppColors.paymentCardHighlight),
          ),
          const Positioned(
            left: 8,
            top: 8,
            child: CircleAvatar(
              radius: 5,
              backgroundColor: AppColors.paymentCardChip,
            ),
          ),
          const Positioned(
            right: 9,
            bottom: 8,
            child: Icon(Icons.contactless, color: AppColors.white, size: 20),
          ),
        ],
      ),
    );
  }
}
