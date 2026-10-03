import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/mock_data/models/app_models.dart';
import 'package:food_app_depi/core/widgets/app_svg_icon.dart';
import 'package:food_app_depi/features/restaurant/screens/restaurant_view_screen.dart';

class SuggestedRestaurantTile extends StatelessWidget {
  final Restaurant restaurant;

  const SuggestedRestaurantTile({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantViewScreen(restaurant: restaurant),
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                restaurant.imageUrl,
                width: 44,
                height: 44,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                restaurant.name,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textDarkest),
              ),
            ),
            const AppSvgIcon('assets/icons/star.svg', size: 14, color: AppColors.orange),
            const SizedBox(width: 4),
            Text('${restaurant.rating}', style: const TextStyle(fontSize: 12, color: AppColors.textDarkest)),
          ],
        ),
      ),
    );
  }
}
