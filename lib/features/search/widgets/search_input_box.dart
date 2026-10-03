import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/widgets/app_svg_icon.dart';
import 'package:food_app_depi/core/widgets/circle_icon_button.dart';

class SearchInputBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onClear;

  const SearchInputBox({
    super.key,
    required this.controller,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderGray),
      ),
      child: Row(
        children: [
          const AppSvgIcon('assets/icons/search.svg',
              size: 20, color: AppColors.muted),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(
                  fontSize: 14, color: AppColors.textDarkest),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          CircleIconButton(
            icon: 'assets/icons/wrong.svg',
            backgroundColor: AppColors.borderGray,
            iconColor: AppColors.white,
            size: 20,
            onTap: onClear,
          )
        ],
      ),
    );
  }
}
