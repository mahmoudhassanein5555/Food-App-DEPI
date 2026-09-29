import 'package:flutter/material.dart';
import '../../../core/home_ui_colors.dart';
import '../../../core/app_icons.dart';
import '../../../core/mock_data.dart';
import '../../../core/widgets/circle_icon_button.dart';
import '../../../core/widgets/restaurant_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../food_listing/screens/food_listing_screen.dart';
import '../../restaurant/screens/restaurant_view_screen.dart';
import '../../search/screens/search_screen.dart';

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
      backgroundColor: HomeUiColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            _buildTopBar(context),
            const SizedBox(height: 20),
            const Text(
              'Hey Halal, Good Afternoon!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: HomeUiColors.textPrimary,
              ),
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
            ...mockRestaurants.take(3).map(
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
        const CircleIconButton(icon: AppIcons.menu),
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
                  color: HomeUiColors.primary,
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
                      fontWeight: FontWeight.w600,
                      color: HomeUiColors.textPrimary,
                    ),
                  ),
                  Icon(AppIcons.locationDropdown, size: 16, color: HomeUiColors.textPrimary),
                ],
              ),
            ],
          ),
        ),
        CircleIconButton(
          icon: AppIcons.cart,
          badgeCount: _cartCount,
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Open cart')),
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
          color: HomeUiColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: HomeUiColors.border),
        ),
        child: Row(
          children: const [
            Icon(AppIcons.search, size: 20, color: HomeUiColors.textSecondary),
            SizedBox(width: 10),
            Text(
              'Search dishes, restaurants',
              style: TextStyle(fontSize: 14, color: HomeUiColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return SizedBox(
      height: 92,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: mockCategories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final category = mockCategories[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FoodListingScreen(categoryName: category.name),
              ),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 64,
                    height: 64,
                    color: HomeUiColors.imagePlaceholder,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: HomeUiColors.textPrimary,
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
