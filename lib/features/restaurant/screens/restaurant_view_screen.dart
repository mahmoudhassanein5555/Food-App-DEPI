import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app_depi/features/cart/data/cart_data_class.dart';
import 'package:food_app_depi/features/cart/data/models/cart_product.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/mock_data/mock_data.dart';
import '../../../core/mock_data/models/app_models.dart';
import '../../../core/widgets/circle_icon_button.dart';
import '../../../core/widgets/food_item_card.dart';
import '../../../core/widgets/rating_info_row.dart';
import '../../food_details/screens/food_details_screen.dart';
import '../widgets/restaurant_image_carousel.dart';
import '../widgets/restaurant_filter_chips.dart';
import '../widgets/restaurant_menu_grid.dart';
class RestaurantViewScreen extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantViewScreen({super.key, required this.restaurant});

  @override
  State<RestaurantViewScreen> createState() => _RestaurantViewScreenState();
}

class _RestaurantViewScreenState extends State<RestaurantViewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            RestaurantImageCarousel(imageUrl: widget.restaurant.imageUrl),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingInfoRow(
                    rating: widget.restaurant.rating,
                    freeDelivery: widget.restaurant.freeDelivery,
                    timeMinutes: widget.restaurant.timeMinutes,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.restaurant.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDarkest,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.restaurant.description ??
                        'Maecenas dolor eget risus varius blandit sit amet non magna. '
                            'Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                    style: const TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        color: AppColors.muted),
                  ),
                  const SizedBox(height: 16),
                  const RestaurantFilterChips(),
                  const SizedBox(height: 20),
                  Text(
                    'Burger (${mockSpicyRestaurantBurgers.length})',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDarkest,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const RestaurantMenuGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

