import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/utils/app_string.dart';
import 'package:food_app_depi/features/cart/widgets/screen_header.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHeader(
      title: AppString.cartTitle,
      onBack: null,
      dark: true,
      trailing: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(foregroundColor: AppColors.successGreen),
        child: const Text(AppString.done),
      ),
    );
  }
}
