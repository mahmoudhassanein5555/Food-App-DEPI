import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/widgets/app_svg_icon.dart';

class CircleIconButton extends StatelessWidget {
  final dynamic icon;
  final VoidCallback? onTap;
  final Color? background;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final int? badgeCount;

  const CircleIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.background,
    this.backgroundColor = AppColors.card,
    this.iconColor = AppColors.text,
    this.size = 40,
    this.badgeCount,
  });

  factory CircleIconButton.back(
    BuildContext context, {
    Color? background,
    Color? iconColor,
  }) {
    return CircleIconButton(
      icon: Icons.chevron_left,
      background: background,
      backgroundColor: background ?? AppColors.card,
      iconColor: iconColor ?? AppColors.text,
      onTap: () => Navigator.of(context).maybePop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final resolvedBackground = background ?? backgroundColor;

    Widget content;
    if (icon is String) {
      content = AppSvgIcon(
        icon as String,
        color: iconColor,
        size: size * 0.45,
      );
    } else if (icon is IconData) {
      content = Icon(
        icon as IconData,
        color: iconColor,
        size: size * 0.55,
      );
    } else {
      content = const SizedBox.shrink();
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: resolvedBackground,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: SizedBox(
              width: size,
              height: size,
              child: Center(child: content),
            ),
          ),
        ),
        if (badgeCount != null && badgeCount! > 0)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.orange,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
              child: Text(
                '$badgeCount',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
