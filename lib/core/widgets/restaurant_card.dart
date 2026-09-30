import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../models/app_models.dart';
import 'rating_info_row.dart';


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
              child: Container(color: AppColors.orderImagePlaceholder),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            restaurant.name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            restaurant.tagsLine,
            style: const TextStyle(fontSize: 12, color: AppColors.mutedGray),
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
