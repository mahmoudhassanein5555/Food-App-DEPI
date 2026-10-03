import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';

class ProfileMenuTile
    extends
        StatelessWidget {
  final Widget icon;
  final Color iconBackground;
  final String label;
  final VoidCallback? onTap;

  const ProfileMenuTile({super.key, required this.icon, required this.label, this.iconBackground = AppColors.white, this.onTap});

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: iconBackground,
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.text,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.placeholder,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuGroup
    extends
        StatelessWidget {
  final List<
    Widget
  >
  tiles;

  const ProfileMenuGroup({super.key, required this.tiles});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(
          18,
        ),
      ),
      child: Column(
        children: tiles,
      ),
    );
  }
}
