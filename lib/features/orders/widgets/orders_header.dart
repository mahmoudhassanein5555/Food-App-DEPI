import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_string.dart';

class OrdersHeader extends StatelessWidget {
  const OrdersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            IconButton.filled(
              onPressed: () => Navigator.of(context).maybePop(),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.card,
                foregroundColor: AppColors.textDarkest,
              ),
              icon: const Icon(Icons.chevron_left),
            ),
            const SizedBox(width: 8),
            const Text(
              AppString.ordersTitle,
              style: TextStyle(
                color: AppColors.textDarkest,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            PopupMenuButton<String>(
              tooltip: AppString.ordersTitle,
              color: AppColors.white,
              icon: const Icon(Icons.more_horiz),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: AppString.ordersMenuHelp,
                  child: Text(AppString.ordersMenuHelp),
                ),
                const PopupMenuItem(
                  value: AppString.ordersMenuSettings,
                  child: Text(AppString.ordersMenuSettings),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
