import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/widgets/circle_icon_button.dart';
import 'package:food_app_depi/features/cart/screens/cart_screen.dart';
import 'package:food_app_depi/core/app_string.dart';

class SearchTopBar extends StatelessWidget {
  const SearchTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIconButton(
          icon: 'assets/icons/arrow_left.svg',
          iconColor: AppColors.black,
          backgroundColor: AppColors.softGray,
          onTap: () => Navigator.pop(context),
        ),
        const SizedBox(width: 14),
        const Text(
          AppString.search,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColors.textDarkest,
          ),
        ),
        const Spacer(),
        CircleIconButton(
          icon: 'assets/icons/cart.svg',
          badgeCount: 2,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CartScreen()),
          ),
        ),
      ],
    );
  }
}
