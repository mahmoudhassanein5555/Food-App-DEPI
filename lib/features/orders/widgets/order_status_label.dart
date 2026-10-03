import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/utils/app_string.dart';
import 'package:food_app_depi/features/orders/models/order_item.dart';

class OrderStatusLabel extends StatelessWidget {
  const OrderStatusLabel({super.key, required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final isCompleted = status == OrderStatus.completed;
    return Text(
      isCompleted ? AppString.orderCompleted : AppString.orderCanceled,
      style: TextStyle(
        color: isCompleted ? AppColors.successGreen : AppColors.errorRed,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
