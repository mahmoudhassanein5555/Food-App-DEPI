class FoodCategory {
  final String name;
  final String imageUrl;

  const FoodCategory({required this.name, required this.imageUrl});
}

class Restaurant {
  final String id;
  final String name;
  final String tagsLine; // e.g. "Burger - Chiken - Riche - Wings"
  final double rating;
  final bool freeDelivery;
  final int timeMinutes;
  final String imageUrl;
  final String? description;

  const Restaurant({
    required this.id,
    required this.name,
    required this.tagsLine,
    required this.rating,
    required this.freeDelivery,
    required this.timeMinutes,
    required this.imageUrl,
    this.description,
  });
}

class FoodItem {
  final String id;
  final String name;
  final String restaurantName;
  final double price;
  final String imageUrl;
  final String? description;

  const FoodItem({
    required this.id,
    required this.name,
    required this.restaurantName,
    required this.price,
    required this.imageUrl,
    this.description,
  });
}
