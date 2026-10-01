import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
