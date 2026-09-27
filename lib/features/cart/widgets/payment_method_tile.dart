import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/features/cart/models/payment_method.dart';
import 'package:food_app_depi/features/cart/widgets/payment_method_mark.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({
    super.key,
    required this.method,
    required this.selected,
    required this.onTap,
  });

  final PaymentMethod method;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 72,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 52,
                  width: 72,
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: selected
                          ? AppColors.primaryOrange
                          : AppColors.transparent,
                      width: 1.4,
                    ),
                  ),
                  child: Center(child: PaymentMethodMark(method: method)),
                ),
                if (selected)
                  const Positioned(
                    top: -6,
                    right: -5,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: AppColors.primaryOrange,
                      child: Icon(
                        Icons.check,
                        size: 11,
                        color: AppColors.white,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              method.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
