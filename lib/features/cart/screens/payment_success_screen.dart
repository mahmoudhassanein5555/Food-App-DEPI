import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/utils/app_string.dart';
import 'package:food_app_depi/features/cart/widgets/orange_action_button.dart';
import 'package:food_app_depi/features/cart/widgets/success_message.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key, required this.total});

  final int total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(child: SuccessMessage(total: total)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: OrangeActionButton(
                label: AppString.trackOrder,
                onPressed: () =>
                    Navigator.of(context).popUntil((route) => route.isFirst),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
