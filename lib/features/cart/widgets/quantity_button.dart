import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton.filled(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(
          backgroundColor: AppColors.cartQuantityButton,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.cartQuantityButton,
          disabledForegroundColor: AppColors.mutedGray,
        ),
        icon: Icon(icon, size: 13),
      ),
    );
  }
}
