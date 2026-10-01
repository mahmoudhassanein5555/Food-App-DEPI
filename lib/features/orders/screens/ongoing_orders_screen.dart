import 'package:flutter/material.dart';
import 'package:food_app_depi/features/orders/models/order_item.dart';
import 'package:food_app_depi/features/orders/widgets/order_list_view.dart';

class OngoingOrdersScreen extends StatelessWidget {
  const OngoingOrdersScreen({super.key, required this.orders});

  final List<OrderItem> orders;

  @override
  Widget build(BuildContext context) {
    return OrderListView(orders: orders);
  }
}
