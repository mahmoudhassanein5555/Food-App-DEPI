import 'package:flutter/material.dart';
import '../home_ui_colors.dart';
import '../app_icons.dart';

/// The "★ 4.7   🚚 Free   🕐 20 min" row used in restaurant/food cards
/// on Home, Food Details, and Restaurant View screens.
class RatingInfoRow extends StatelessWidget {
  final double rating;
  final bool freeDelivery;
  final int timeMinutes;
  final double iconSize;
  final double fontSize;

  const RatingInfoRow({
    super.key,
    required this.rating,
    required this.freeDelivery,
    required this.timeMinutes,
    this.iconSize = 16,
    this.fontSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: HomeUiColors.textPrimary,
    );

    return Row(
      children: [
        Icon(AppIcons.star, size: iconSize, color: HomeUiColors.primary),
        const SizedBox(width: 4),
        Text('$rating', style: textStyle),
        const SizedBox(width: 14),
        Icon(AppIcons.delivery, size: iconSize, color: HomeUiColors.primary),
        const SizedBox(width: 4),
        Text(freeDelivery ? 'Free' : 'Paid', style: textStyle),
        const SizedBox(width: 14),
        Icon(AppIcons.clock, size: iconSize, color: HomeUiColors.primary),
        const SizedBox(width: 4),
        Text('$timeMinutes min', style: textStyle),
      ],
    );
  }
}
