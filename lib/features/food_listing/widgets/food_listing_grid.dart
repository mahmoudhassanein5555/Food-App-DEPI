import 'package:flutter/material.dart';
import 'package:food_app_depi/core/mock_data.dart';
import 'package:food_app_depi/core/widgets/food_item_card.dart';
import 'package:food_app_depi/features/cart/data/cart_data_class.dart';
import 'package:food_app_depi/features/cart/data/models/cart_product.dart';
import 'package:food_app_depi/features/food_details/screens/food_details_screen.dart';

class FoodListingGrid extends StatelessWidget {
  const FoodListingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mockBurgers.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) {
        final item = mockBurgers[index];
        return FoodItemCard(
          item: item,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => FoodDetailsScreen(item: item)),
          ),
          onAdd: () {
            CartDataClass.addToCart(
              CartProduct(
                name: item.name,
                price: item.price.toInt(),
                imageUrl: item.imageUrl,
              ),
              1,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Added ${item.name} to cart')),
            );
          },
        );
      },
    );
  }
}
