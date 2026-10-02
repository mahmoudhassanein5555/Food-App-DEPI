import 'package:food_app_depi/core/mock_data.dart';
import 'package:food_app_depi/features/cart/data/models/cart_product.dart';

class CartDataClass {
  static final List<CartProduct> cartItems = [
    CartProduct(
        name: mockBurgers[0].name,
        price: mockBurgers[0].price.toInt(),
        imageUrl: mockBurgers[0].imageUrl),
    CartProduct(
        name: mockBurgers[1].name,
        price: mockBurgers[1].price.toInt(),
        imageUrl: mockBurgers[1].imageUrl),
  ];
  static void addToCart(CartProduct product, int quantity) {
    cartItems.add(product);
  }

  static void removeFromCart(CartProduct product) {
    cartItems.remove(product);
  }
}
