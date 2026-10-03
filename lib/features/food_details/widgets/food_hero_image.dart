import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/widgets/circle_icon_button.dart';

class FoodHeroImage extends StatefulWidget {
  final String imageUrl;

  const FoodHeroImage({super.key, required this.imageUrl});

  @override
  State<FoodHeroImage> createState() => _FoodHeroImageState();
}

class _FoodHeroImageState extends State<FoodHeroImage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(28)),
          child: Image.asset(
            widget.imageUrl,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: CircleIconButton(
            icon: 'assets/icons/arrow_left.svg',
            backgroundColor: AppColors.white,
            iconColor: AppColors.textDarkest,
            onTap: () => Navigator.pop(context),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: CircleIconButton(
            icon: _isFavorite
                ? 'assets/icons/heart_filled.svg'
                : 'assets/icons/heart_outline.svg',
            backgroundColor: AppColors.white,
            iconColor: AppColors.orange,
            onTap: () => setState(() => _isFavorite = !_isFavorite),
          ),
        ),
      ],
    );
  }
}
