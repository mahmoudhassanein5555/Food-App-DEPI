import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        const ColoredBox(
          color: Color(0xFF121223),
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