import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/mock_data.dart';

class SearchRecentKeywords extends StatelessWidget {
  final void Function(String) onKeywordSelected;

  const SearchRecentKeywords({
    super.key,
    required this.onKeywordSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: recentKeywords
          .map(
            (keyword) => GestureDetector(
              onTap: () => onKeywordSelected(keyword),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.borderGray),
                ),
                child: Text(
                  keyword,
                  style: const TextStyle(
                      fontSize: 13, color: AppColors.textDarkest),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
