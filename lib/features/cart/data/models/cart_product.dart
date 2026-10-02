class CartProduct {
  CartProduct({required this.name, required this.price, required this.imageUrl, this.quantity = 1});

  final String name;
  final int price;
  final String imageUrl;
  int quantity;
}
