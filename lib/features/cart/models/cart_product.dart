class CartProduct {
  CartProduct({required this.name, required this.price, this.quantity = 1});

  final String name;
  final int price;
  int quantity;
}
