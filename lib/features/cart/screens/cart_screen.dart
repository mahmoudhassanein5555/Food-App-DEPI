import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/features/cart/data/cart_data_class.dart';
import 'package:food_app_depi/features/cart/data/models/cart_product.dart';
import 'package:food_app_depi/features/cart/screens/payment_screen.dart';
import 'package:food_app_depi/features/cart/widgets/cart_details_panel.dart';
import 'package:food_app_depi/features/cart/widgets/cart_header.dart';
import 'package:food_app_depi/features/cart/widgets/cart_item_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, this.onBackToHome});

  final VoidCallback? onBackToHome;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartProduct> _products = CartDataClass.cartItems;

  int get _total => _products.fold(
        0,
        (sum, product) => sum + product.price * product.quantity,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textDarkest,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  CartHeader(
                    onBack: widget.onBackToHome ??
                        () => Navigator.of(context).maybePop(),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      itemCount: _products.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        final product = _products[index];
                        return CartItemTile(
                          product: product,
                          onRemove: () => setState(() {
                            _products.removeAt(index);
                          }),
                          onQuantityChanged: (quantity) => setState(() {
                            product.quantity = quantity;
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: CartDetailsPanel(
                total: _total,
                onPlaceOrder: _products.isEmpty
                    ? null
                    : () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => PaymentScreen(total: _total),
                          ),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
