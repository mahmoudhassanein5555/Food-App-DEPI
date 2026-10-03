import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/widgets/circle_icon_button.dart';
import 'package:food_app_depi/core/widgets/app_svg_icon.dart';
import 'package:food_app_depi/features/cart/screens/cart_screen.dart';
import 'package:food_app_depi/features/orders/screens/orders_screen.dart';
import 'package:food_app_depi/core/utils/app_string.dart';

class HomeTopBar extends StatelessWidget {
  final int cartCount;

  const HomeTopBar({super.key, required this.cartCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIconButton(
          icon: 'assets/icons/menu.svg',
          backgroundColor: AppColors.borderGray,
          size: 45,
          iconColor: AppColors.black,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OrdersScreen()),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.deliverTo,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orange,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    AppString.halalLabOffice,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textDarkest,
                    ),
                  ),
                  AppSvgIcon(
                    'assets/icons/dropdown_triangle.svg',
                    size: 8,
                    color: AppColors.textDarkest,
                  ),
                ],
              ),
            ],
          ),
        ),
        CircleIconButton(
          icon: 'assets/icons/cart.svg',
          badgeCount: cartCount,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CartScreen()),
          ),
        ),
      ],
    );
  }
}
