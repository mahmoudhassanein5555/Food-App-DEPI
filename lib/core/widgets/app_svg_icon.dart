import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Drop-in replacement for `Icon(IconData)` that renders an SVG file
/// instead, tinted to [color].
///
/// Usage — pass the asset path directly, no icon-constants class needed:
///   AppSvgIcon('assets/icons/search.svg', size: 20, color: AppColors.textSecondary)
class AppSvgIcon extends StatelessWidget {
  final String assetPath;
  final double size;
  final Color color;

  const AppSvgIcon(
    this.assetPath, {
    super.key,
    this.size = 24,
    this.color = Colors.black, 
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      placeholderBuilder: (context) => SizedBox(width: size, height: size),
    );
  }
}
