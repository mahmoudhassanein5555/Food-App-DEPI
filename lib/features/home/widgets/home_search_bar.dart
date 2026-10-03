import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/widgets/app_svg_icon.dart';
import 'package:food_app_depi/features/search/screens/search_screen.dart';
import 'package:food_app_depi/core/utils/app_string.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: const Row(
          children: [
            AppSvgIcon(
              'assets/icons/search.svg',
              size: 20,
              color: AppColors.muted,
            ),
            SizedBox(width: 10),
            Text(
              AppString.searchHint,
              style: TextStyle(fontSize: 14, color: AppColors.muted),
            ),
          ],
        ),
      ),
    );
  }
}
