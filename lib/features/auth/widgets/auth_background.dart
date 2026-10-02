import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_depi/core/app_colors.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key,
    this.showBack = false,
    this.onBack,
  });

  final bool showBack;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.background,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(
            'assets/icons/top_decoration.svg',
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(
            'assets/icons/dashed_decoration.svg',
          ),
        ),
      ],
    );
  }
}
