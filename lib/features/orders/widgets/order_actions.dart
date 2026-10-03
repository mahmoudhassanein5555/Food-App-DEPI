import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/utils/app_string.dart';

class OrderActions extends StatelessWidget {
  const OrderActions({super.key, required this.isHistory});

  final bool isHistory;

  @override
  Widget build(BuildContext context) {
    final primaryLabel = isHistory
        ? AppString.reorderAction
        : AppString.trackOrderAction;
    final secondaryLabel = isHistory
        ? AppString.rateOrderAction
        : AppString.cancelOrderAction;

    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.orange,
              foregroundColor: AppColors.white,
              minimumSize: const Size.fromHeight(36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              textStyle: const TextStyle(fontSize: 11),
            ),
            child: Text(primaryLabel),
          ),
        ),
        const SizedBox(width: 28),
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryOrangeDark,
              side: const BorderSide(color: AppColors.orange),
              minimumSize: const Size.fromHeight(36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              textStyle: const TextStyle(fontSize: 11),
            ),
            child: Text(secondaryLabel),
          ),
        ),
      ],
    );
  }
}
