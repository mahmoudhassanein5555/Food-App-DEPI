import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    super.key,
    required this.title,
    required this.onBack,
    this.dark = false,
    this.trailing,
  });

  final String title;
  final VoidCallback? onBack;
  final bool dark;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final foreground = dark ? AppColors.white : AppColors.textDarkest;
    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            IconButton.filled(
              onPressed: onBack,
              style: IconButton.styleFrom(
                backgroundColor: dark
                    ? AppColors.cartHeaderButton
                    : AppColors.card,
                foregroundColor: foreground,
              ),
              icon: const Icon(Icons.chevron_left),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: foreground,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            // ?trailing,
          ],
        ),
      ),
    );
  }
}
