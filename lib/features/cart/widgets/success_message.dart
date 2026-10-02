import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_string.dart';
import 'package:food_app_depi/features/cart/widgets/success_artwork.dart';

class SuccessMessage extends StatelessWidget {
  const SuccessMessage({super.key, required this.total});

  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SuccessArtwork(),
        const SizedBox(height: 24),
        const Text(
          AppString.congratulations,
          style: TextStyle(
            color: AppColors.textDarkest,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          AppString.paymentSuccessTemplate.replaceFirst(
            '{amount}',
            '${AppString.currencySymbol}$total',
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.mutedGray,
            height: 1.5,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
