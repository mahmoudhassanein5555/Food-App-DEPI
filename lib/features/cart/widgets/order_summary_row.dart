import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_string.dart';

class OrderSummaryRow extends StatelessWidget {
  const OrderSummaryRow({super.key, required this.total});

  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          AppString.total,
          style: TextStyle(color: AppColors.mutedGray, fontSize: 11),
        ),
        const SizedBox(width: 10),
        Text(
          '${AppString.currencySymbol}$total',
          style: const TextStyle(
            color: AppColors.textDarkest,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryOrangeDark,
          ),
          child: const Row(
            children: [
              Text(AppString.breakdown),
              Icon(Icons.chevron_right, size: 18, color: AppColors.textDarkest),
            ],
          ),
        ),
      ],
    );
  }
}
