import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_string.dart';
import 'package:food_app_depi/features/orders/models/order_item.dart';
import 'package:food_app_depi/features/orders/screens/order_history_screen.dart';
import 'package:food_app_depi/features/orders/screens/ongoing_orders_screen.dart';
import 'package:food_app_depi/features/orders/widgets/orders_header.dart';
import 'package:food_app_depi/features/orders/widgets/orders_tab_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  static const List<OrderItem> _ongoingOrders = [
    OrderItem(
      category: AppString.foodCategory,
      restaurantName: AppString.pizzaHut,
      orderNumber: AppString.pizzaHutOrderNumber,
      price: 35.25,
      itemCount: 3,
    ),
    OrderItem(
      category: AppString.drinkCategory,
      restaurantName: AppString.mcDonalds,
      orderNumber: AppString.mcDonaldsOrderNumber,
      price: 40.15,
      itemCount: 2,
    ),
    OrderItem(
      category: AppString.drinkCategory,
      restaurantName: AppString.starbucks,
      orderNumber: AppString.starbucksOrderNumber,
      price: 10.20,
      itemCount: 1,
    ),
  ];

  static const List<OrderItem> _historyOrders = [
    OrderItem(
      category: AppString.foodCategory,
      restaurantName: AppString.pizzaHut,
      orderNumber: AppString.pizzaHutOrderNumber,
      price: 35.25,
      itemCount: 3,
      date: AppString.orderDateJan29,
      status: OrderStatus.completed,
    ),
    OrderItem(
      category: AppString.drinkCategory,
      restaurantName: AppString.mcDonalds,
      orderNumber: AppString.mcDonaldsOrderNumber,
      price: 40.15,
      itemCount: 2,
      date: AppString.orderDateJan30,
      status: OrderStatus.completed,
    ),
    OrderItem(
      category: AppString.drinkCategory,
      restaurantName: AppString.starbucks,
      orderNumber: AppString.starbucksOrderNumber,
      price: 10.20,
      itemCount: 1,
      date: AppString.orderDateJan30,
      status: OrderStatus.canceled,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                children: [
                  const OrdersHeader(),
                  const OrdersTabBar(),
                  Expanded(
                    child: TabBarView(
                      children: [
                        OngoingOrdersScreen(orders: _ongoingOrders),
                        OrderHistoryScreen(orders: _historyOrders),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
