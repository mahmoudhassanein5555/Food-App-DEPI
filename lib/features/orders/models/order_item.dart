enum OrderStatus { completed, canceled }

enum OrderAction { track, cancel, rate, reorder }

class OrderItem {
  const OrderItem({
    required this.category,
    required this.restaurantName,
    required this.orderNumber,
    required this.price,
    required this.itemCount,
    this.date,
    this.status,
  });

  final String category;
  final String restaurantName;
  final String orderNumber;
  final double price;
  final int itemCount;
  final String? date;
  final OrderStatus? status;

  bool get isHistory => status != null;
}
