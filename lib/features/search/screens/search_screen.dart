import 'package:flutter/material.dart';
import '../../../core/home_ui_colors.dart';
import '../../../core/app_icons.dart';
import '../../../core/mock_data.dart';
import '../../../core/models/app_models.dart';
import '../../../core/widgets/circle_icon_button.dart';
import '../../restaurant/screens/restaurant_view_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: 'Pizza');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeUiColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            _buildTopBar(context),
            const SizedBox(height: 16),
            _buildSearchInput(),
            const SizedBox(height: 22),
            const Text(
              'Recent Keywords',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: HomeUiColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            _buildRecentKeywords(context),
            const SizedBox(height: 22),
            const Text(
              'Suggested Restaurants',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: HomeUiColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            ...mockRestaurants
                .take(3)
                .map((r) => _SuggestedRestaurantTile(restaurant: r)),
            const SizedBox(height: 22),
            const Text(
              'Popular Fast Food',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: HomeUiColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            _buildPopularFastFood(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      children: [
        CircleIconButton(
          icon: AppIcons.back,
          backgroundColor: HomeUiColors.primaryDark,
          onTap: () => Navigator.pop(context),
        ),
        const SizedBox(width: 14),
        const Text(
          'Search',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: HomeUiColors.textPrimary,
          ),
        ),
        const Spacer(),
        const CircleIconButton(icon: AppIcons.cart, badgeCount: 2),
      ],
    );
  }

  Widget _buildSearchInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: HomeUiColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: HomeUiColors.border),
      ),
      child: Row(
        children: [
          const Icon(AppIcons.search, size: 20, color: HomeUiColors.textSecondary),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(fontSize: 14, color: HomeUiColors.textPrimary),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _controller.clear()),
            child: const Icon(AppIcons.clearInput, size: 20, color: HomeUiColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentKeywords(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: recentKeywords
          .map(
            (keyword) => GestureDetector(
              onTap: () => setState(() => _controller.text = keyword),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                decoration: BoxDecoration(
                  color: HomeUiColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: HomeUiColors.border),
                ),
                child: Text(
                  keyword,
                  style: const TextStyle(fontSize: 13, color: HomeUiColors.textPrimary),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildPopularFastFood(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: mockRestaurants.length,
        separatorBuilder: (_, _) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final restaurant = mockRestaurants[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RestaurantViewScreen(restaurant: restaurant),
              ),
            ),
            child: SizedBox(
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      restaurant.imageUrl,
                      width: 140,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        width: 140,
                        height: 100,
                        color: HomeUiColors.imagePlaceholder,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    restaurant.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: HomeUiColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SuggestedRestaurantTile extends StatelessWidget {
  final Restaurant restaurant;

  const _SuggestedRestaurantTile({required this.restaurant});

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
              child: Image.network(
                restaurant.imageUrl,
                width: 44,
                height: 44,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    Container(width: 44, height: 44, color: HomeUiColors.imagePlaceholder),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                restaurant.name,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: HomeUiColors.textPrimary),
              ),
            ),
            Icon(AppIcons.star, size: 14, color: HomeUiColors.primary),
            const SizedBox(width: 4),
            Text('${restaurant.rating}', style: const TextStyle(fontSize: 12, color: HomeUiColors.textPrimary)),
          ],
        ),
      ),
    );
  }
}
