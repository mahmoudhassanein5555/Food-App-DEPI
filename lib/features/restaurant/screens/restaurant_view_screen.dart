import 'package:flutter/material.dart';
import '../../../core/home_ui_colors.dart';
import '../../../core/app_icons.dart';
import '../../../core/mock_data.dart';
import '../../../core/models/app_models.dart';
import '../../../core/widgets/circle_icon_button.dart';
import '../../../core/widgets/food_item_card.dart';
import '../../../core/widgets/rating_info_row.dart';
import '../../food_details/screens/food_details_screen.dart';

class RestaurantViewScreen extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantViewScreen({super.key, required this.restaurant});

  @override
  State<RestaurantViewScreen> createState() => _RestaurantViewScreenState();
}

class _RestaurantViewScreenState extends State<RestaurantViewScreen> {
  final _pageController = PageController();
  int _activePage = 0;
  int _selectedFilterIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeUiColors.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildImageCarousel(context),
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
                      color: HomeUiColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.restaurant.description ??
                        'Maecenas dolor eget risus varius blandit sit amet non magna. '
                            'Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                    style: const TextStyle(fontSize: 13, height: 1.5, color: HomeUiColors.textSecondary),
                  ),
                  const SizedBox(height: 16),
                  _buildFilterChips(),
                  const SizedBox(height: 20),
                  Text(
                    'Burger (${mockSpicyRestaurantBurgers.length})',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: HomeUiColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildMenuGrid(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 260,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _activePage = i),
            itemCount: 3,
            itemBuilder: (context, index) => Container(color: HomeUiColors.imagePlaceholder),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: CircleIconButton(
            icon: AppIcons.back,
            backgroundColor: HomeUiColors.surface,
            iconColor: HomeUiColors.textPrimary,
            onTap: () => Navigator.pop(context),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: CircleIconButton(
            icon: AppIcons.moreOptions,
            backgroundColor: HomeUiColors.surface,
            iconColor: HomeUiColors.textPrimary,
            onTap: () {},
          ),
        ),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: _activePage == index ? 18 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: _activePage == index ? Colors.white : Colors.white54,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: foodFilterTags.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final selected = index == _selectedFilterIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedFilterIndex = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? HomeUiColors.primary : HomeUiColors.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: selected ? HomeUiColors.primary : HomeUiColors.border),
              ),
              child: Text(
                foodFilterTags[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : HomeUiColors.textPrimary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mockSpicyRestaurantBurgers.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) {
        final item = mockSpicyRestaurantBurgers[index];
        return FoodItemCard(
          item: item,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => FoodDetailsScreen(item: item)),
          ),
          onAdd: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Added ${item.name} to cart')),
          ),
        );
      },
    );
  }
}
