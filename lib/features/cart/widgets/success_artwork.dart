import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';

class SuccessArtwork extends StatelessWidget {
  const SuccessArtwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 145,
      decoration: BoxDecoration(
        color: AppColors.successArtworkBackground,
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Icon(Icons.check_rounded, color: AppColors.white, size: 66),
    );
  }
}
