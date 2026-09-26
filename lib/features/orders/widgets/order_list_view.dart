import 'package:flutter/material.dart';
import 'package:food_app_depi/features/orders/models/order_item.dart';
import 'package:food_app_depi/features/orders/widgets/order_section.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key, required this.orders});

  final List<OrderItem> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 22),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 18),
      itemBuilder: (context, index) => OrderSection(order: orders[index]),
    );
  }
}
