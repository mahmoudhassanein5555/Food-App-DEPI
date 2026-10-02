import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/models/app_models.dart';
import 'package:food_app_depi/core/widgets/app_svg_icon.dart';
import 'package:food_app_depi/features/cart/data/cart_data_class.dart';
import 'package:food_app_depi/features/cart/data/models/cart_product.dart';
import 'package:food_app_depi/core/app_string.dart';

class FoodBottomBar extends StatefulWidget {
  final FoodItem item;

  const FoodBottomBar({super.key, required this.item});

  @override
  State<FoodBottomBar> createState() => _FoodBottomBarState();
}

class _FoodBottomBarState extends State<FoodBottomBar> {
  int _quantity = 2;

  @override
  Widget build(BuildContext context) {
    final total = widget.item.price * _quantity;
    return Container(
      padding: EdgeInsets.fromLTRB(
          20, 14, 20, 14 + MediaQuery.of(context).padding.bottom),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDarkest,
                ),
              ),
              _buildQuantityStepper(),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                CartDataClass.addToCart(
                  CartProduct(
                    name: widget.item.name,
                    price: widget.item.price.toInt(),
                    imageUrl: widget.item.imageUrl,
                    quantity: _quantity,
                  ),
                  _quantity,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Added $_quantity x ${widget.item.name} to cart')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text(
                AppString.addToCart,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityStepper() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.textDarkest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          _stepperButton('assets/icons/minus.svg', () {
            if (_quantity > 1) setState(() => _quantity--);
          }),
          SizedBox(
            width: 26,
            child: Text(
              '$_quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          _stepperButton(
              'assets/icons/add.svg', () => setState(() => _quantity++)),
        ],
      ),
    );
  }

  Widget _stepperButton(String icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        alignment: Alignment.center,
        child: AppSvgIcon(icon, size: 14, color: Colors.white),
      ),
    );
  }
}
