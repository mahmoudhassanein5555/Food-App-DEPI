import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_string.dart';
import 'package:food_app_depi/features/cart/widgets/delivery_address_panel.dart';
import 'package:food_app_depi/features/cart/widgets/orange_action_button.dart';
import 'package:food_app_depi/features/cart/widgets/order_summary_row.dart';

class CartDetailsPanel extends StatelessWidget {
  const CartDetailsPanel({
    super.key,
    required this.total,
    required this.onPlaceOrder,
  });

  final int total;
  final VoidCallback? onPlaceOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DeliveryAddressPanel(),
          const Spacer(),
          OrderSummaryRow(total: total),
          const SizedBox(height: 18),
          OrangeActionButton(
            label: AppString.placeOrder,
            onPressed: onPlaceOrder,
          ),
        ],
      ),
    );
  }
}
