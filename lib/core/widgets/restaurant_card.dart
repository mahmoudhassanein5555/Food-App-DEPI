import 'package:flutter/material.dart';
import '../home_ui_colors.dart';
import '../models/app_models.dart';
import 'rating_info_row.dart';

/// Full-width restaurant card used on Home ("Open Restaurants") and
/// Food-Burgers listing ("Open Restaurants") screens.
class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final VoidCallback? onTap;

  const RestaurantCard({super.key, required this.restaurant, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: Image.network(
                restaurant.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    Container(color: HomeUiColors.imagePlaceholder),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            restaurant.name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: HomeUiColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            restaurant.tagsLine,
            style: const TextStyle(fontSize: 12, color: HomeUiColors.textMuted),
          ),
          const SizedBox(height: 6),
          RatingInfoRow(
            rating: restaurant.rating,
            freeDelivery: restaurant.freeDelivery,
            timeMinutes: restaurant.timeMinutes,
          ),
        ],
      ),
    );
  }
}
