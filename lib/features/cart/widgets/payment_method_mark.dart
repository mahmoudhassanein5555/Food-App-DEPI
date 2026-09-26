import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_string.dart';
import 'package:food_app_depi/features/cart/models/payment_method.dart';

class PaymentMethodMark extends StatelessWidget {
  const PaymentMethodMark({super.key, required this.method});

  final PaymentMethod method;

  @override
  Widget build(BuildContext context) {
    if (method == PaymentMethod.mastercard) {
      return const SizedBox(
        width: 28,
        height: 18,
        child: Stack(
          children: [
            Positioned(
              left: 2,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: AppColors.mastercardRed,
              ),
            ),
            Positioned(
              right: 2,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: AppColors.mastercardOrange,
              ),
            ),
          ],
        ),
      );
    }
    if (method == PaymentMethod.visa) {
      return const Text(
        AppString.visaMark,
        style: TextStyle(
          color: AppColors.visaBlue,
          fontSize: 14,
          fontWeight: FontWeight.w800,
          fontStyle: FontStyle.italic,
        ),
      );
    }
    return Icon(method.icon, color: AppColors.primaryOrange, size: 23);
  }
}
