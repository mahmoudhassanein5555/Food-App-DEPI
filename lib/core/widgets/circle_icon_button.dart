import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';

class CircleIconButton
    extends
        StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color background;
  final Color iconColor;

  const CircleIconButton({super.key, required this.icon, this.onTap, this.background = AppColors.card, this.iconColor = AppColors.textDark});
  factory CircleIconButton.back(BuildContext context) {
    return CircleIconButton(
      icon: Icons.chevron_left,
      onTap: () => Navigator.of(
        context,
      ).maybePop(),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: background,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 22,
        ),
      ),
    );
  }
}
