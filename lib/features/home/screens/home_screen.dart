import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../core/mock_data.dart';
import '../../../core/widgets/circle_icon_button.dart';
import '../../../core/widgets/restaurant_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../food_listing/screens/food_listing_screen.dart';
import '../../restaurant/screens/restaurant_view_screen.dart';
import '../../search/screens/search_screen.dart';
import '../../cart/screens/cart_screen.dart';
import '../../orders/screens/orders_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _cartCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            _buildTopBar(context),
            const SizedBox(height: 20),
            Row(
              children: const [
                Text(
                  'Hey Halal,',
                  style: TextStyle(fontSize: 20, color: AppColors.textPrimary),
                ),
                Text(
                  ' Good Afternoon!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSearchBar(context),
            const SizedBox(height: 24),
            SectionHeader(title: 'All Categories', onSeeAll: () {}),
            const SizedBox(height: 12),
            _buildCategories(context),
            const SizedBox(height: 24),
            SectionHeader(title: 'Open Restaurants', onSeeAll: () {}),
            const SizedBox(height: 12),
            ...mockRestaurants
                .take(3)
                .map(
                  (r) => Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: RestaurantCard(
                      restaurant: r,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RestaurantViewScreen(restaurant: r),
                        ),
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'DELIVER TO',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryOrange,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    'Halal Lab office',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  AppSvgIcon(
                    'assets/icons/dropdown_triangle.svg',
                    size: 8,
                    color: AppColors.textPrimary,
                  ),
                ],
              ),
            ],
          ),
        ),
        CircleIconButton(
          icon: 'assets/icons/cart.svg',
          badgeCount: _cartCount,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CartScreen()),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SearchScreen()),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderGray),
        ),
        child: Row(
          children: const [
            AppSvgIcon(
              'assets/icons/search.svg',
              size: 20,
              color: AppColors.textSecondary,
            ),
            SizedBox(width: 10),
            Text(
              'Search dishes, restaurants',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    final visibleCategories = mockCategories
        .where(
          (category) => category.name == 'Pizza' || category.name == 'Burger',
        )
        .take(3)
        .toList();

    return SizedBox(
      height: 92,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: visibleCategories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final category = visibleCategories[index];

          return GestureDetector(
            onTap: category.name == 'Burger'
                ? () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          FoodListingScreen(categoryName: category.name),
                    ),
                  )
                : null,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 64,
                    height: 64,
                    color: AppColors.orderImagePlaceholder,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
