import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/utils/app_string.dart';
import 'package:food_app_depi/features/cart/data/models/cart_product.dart';
import 'package:food_app_depi/features/cart/widgets/quantity_button.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.product,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  final CartProduct product;
  final VoidCallback onRemove;
  final ValueChanged<int> onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 90,
              height: 90,
              child: Image.asset(product.imageUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: onRemove,
                      visualDensity: VisualDensity.compact,
                      constraints: const BoxConstraints.tightFor(
                        width: 28,
                        height: 28,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.errorRed,
                        foregroundColor: AppColors.white,
                      ),
                      icon: const Icon(Icons.close, size: 17),
                    ),
                  ],
                ),
                Text(
                  '${AppString.currencySymbol}${product.price}',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text(
                      AppString.productSize,
                      style: TextStyle(color: AppColors.mutedGray),
                    ),
                    const Spacer(),
                    QuantityButton(
                      icon: Icons.remove,
                      onPressed: product.quantity > 1
                          ? () => onQuantityChanged(product.quantity - 1)
                          : null,
                    ),
                    SizedBox(
                      width: 34,
                      child: Text(
                        '${product.quantity}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.white),
                      ),
                    ),
                    QuantityButton(
                      icon: Icons.add,
                      onPressed: () => onQuantityChanged(product.quantity + 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
