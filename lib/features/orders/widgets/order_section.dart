import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/features/orders/models/order_item.dart';
import 'package:food_app_depi/features/orders/widgets/order_status_label.dart';
import 'package:food_app_depi/features/orders/widgets/order_tile.dart';

class OrderSection extends StatelessWidget {
  const OrderSection({super.key, required this.order});

  final OrderItem order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                order.category,
                style: const TextStyle(
                  color: AppColors.textDarkest,
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              if (order.status != null)
                OrderStatusLabel(status: order.status!)
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.borderGray),
        const SizedBox(height: 12),
        OrderTile(order: order),
      ],
    );
  }
}
