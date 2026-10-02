import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/mock_data.dart';
import 'package:food_app_depi/features/search/widgets/search_top_bar.dart';
import 'package:food_app_depi/features/search/widgets/search_input_box.dart';
import 'package:food_app_depi/features/search/widgets/search_recent_keywords.dart';
import 'package:food_app_depi/features/search/widgets/search_popular_fast_food.dart';
import 'package:food_app_depi/features/search/widgets/suggested_restaurant_tile.dart';
import 'package:food_app_depi/core/app_string.dart';

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
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            const SearchTopBar(),
            const SizedBox(height: 16),
            SearchInputBox(
              controller: _controller,
              onClear: () => setState(() => _controller.clear()),
            ),
            const SizedBox(height: 22),
            const Text(
              AppString.recentKeywords,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.textDarkest,
              ),
            ),
            const SizedBox(height: 10),
            SearchRecentKeywords(
              onKeywordSelected: (keyword) =>
                  setState(() => _controller.text = keyword),
            ),
            const SizedBox(height: 22),
            const Text(
              AppString.suggestedRestaurants,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.textDarkest,
              ),
            ),
            const SizedBox(height: 10),
            ...mockRestaurants.take(3).map((r) => SuggestedRestaurantTile(restaurant: r)),
            const SizedBox(height: 22),
            const Text(
              AppString.popularFastFood,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.textDarkest,
              ),
            ),
            const SizedBox(height: 10),
            const SearchPopularFastFood(),
          ],
        ),
      ),
    );
  }
}
