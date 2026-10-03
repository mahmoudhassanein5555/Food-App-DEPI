import 'package:flutter/material.dart';
import 'package:food_app_depi/features/cart/data/cart_data_class.dart';
import 'package:food_app_depi/features/cart/data/models/cart_product.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../core/mock_data/models/app_models.dart';
import '../../../core/widgets/circle_icon_button.dart';
import '../../../core/widgets/rating_info_row.dart';
import '../widgets/food_hero_image.dart';
import '../widgets/food_size_selector.dart';
import '../widgets/food_ingredients.dart';
import '../widgets/food_bottom_bar.dart';
import 'package:food_app_depi/core/utils/app_string.dart';

class FoodDetailsScreen extends StatefulWidget {
  final FoodItem item;

  const FoodDetailsScreen({super.key, required this.item});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  double get _unitPrice => widget.item.price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  FoodHeroImage(imageUrl: widget.item.imageUrl),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDarkest,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const AppSvgIcon(
                              'assets/icons/location.svg',
                              size: 13,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.item.restaurantName,
                              style: const TextStyle(
                                  fontSize: 13, color: AppColors.mutedGray),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const RatingInfoRow(
                            rating: 4.7, freeDelivery: true, timeMinutes: 20),
                        const SizedBox(height: 14),
                        Text(
                          widget.item.description ??
                              'Maecenas dolor eget risus varius blandit sit amet non magna. '
                                  'Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.5,
                            color: AppColors.muted,
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          AppString.size,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mutedGray,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const FoodSizeSelector(),
                        const SizedBox(height: 18),
                        const Text(
                          AppString.ingredients,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mutedGray,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const FoodIngredients(),
                        const SizedBox(height: 110),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FoodBottomBar(item: widget.item),
    );
  }
}
