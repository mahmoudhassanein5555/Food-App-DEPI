import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'app_svg_icon.dart';
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
      color: AppColors.textDarkest,
    );

    return Row(
      children: [
        AppSvgIcon('assets/icons/star.svg', size: iconSize, color: AppColors.orange),
        const SizedBox(width: 4),
        Text('$rating', style: textStyle),
        const SizedBox(width: 14),
        AppSvgIcon('assets/icons/truck.svg', size: iconSize, color: AppColors.orange),
        const SizedBox(width: 4),
        Text(freeDelivery ? 'Free' : 'Paid', style: textStyle),
        const SizedBox(width: 14),
        AppSvgIcon('assets/icons/clock.svg', size: iconSize, color: AppColors.orange),
        const SizedBox(width: 4),
        Text('$timeMinutes min', style: textStyle),
      ],
    );
  }
}
