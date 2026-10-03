import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/utils/app_string.dart';

class DeliveryAddressPanel extends StatelessWidget {
  const DeliveryAddressPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              AppString.deliveryAddressTitle,
              style: TextStyle(color: AppColors.mutedGray, fontSize: 11),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryOrangeDark,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(AppString.edit),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.field,
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Text(
            AppString.deliveryAddress,
            style: TextStyle(color: AppColors.muted, fontSize: 13),
          ),
        ),
      ],
    );
  }
}
