import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/features/cart/widgets/orange_action_button.dart';
import 'package:food_app_depi/features/cart/widgets/order_summary_row.dart';

class CheckoutFooter extends StatelessWidget {
  const CheckoutFooter({
    super.key,
    required this.total,
    required this.label,
    required this.onPressed,
  });

  final int total;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 18),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.borderGray)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OrderSummaryRow(total: total),
          const SizedBox(height: 8),
          OrangeActionButton(label: label, onPressed: onPressed),
        ],
      ),
    );
  }
}
