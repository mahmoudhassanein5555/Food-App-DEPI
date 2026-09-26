import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_string.dart';

class OrdersTabBar extends StatelessWidget {
  const OrdersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.primaryOrange,
      indicatorWeight: 2,
      dividerColor: AppColors.borderGray,
      labelColor: AppColors.primaryOrangeDark,
      unselectedLabelColor: AppColors.mutedGray,
      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
      tabs: const [
        Tab(text: AppString.ongoingOrders),
        Tab(text: AppString.orderHistory),
      ],
    );
  }
}
