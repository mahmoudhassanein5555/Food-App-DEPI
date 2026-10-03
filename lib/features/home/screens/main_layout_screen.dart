import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/features/home/screens/home_screen.dart';
import 'package:food_app_depi/features/cart/screens/cart_screen.dart';
import 'package:food_app_depi/features/orders/screens/orders_screen.dart';
import 'package:food_app_depi/features/profile/profile_screen.dart';
import 'package:food_app_depi/core/utils/app_string.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CartScreen(),
    const OrdersScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.orange,
          unselectedItemColor: AppColors.textGrey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon('assets/icons/home.svg', 0),
              label: AppString.home,
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('assets/icons/cart.svg', 1),
              label: AppString.cart,
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('assets/icons/bag.svg', 2), // Assuming bag is for orders
              label: AppString.orders,
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('assets/icons/person.svg', 3),
              label: AppString.profile,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String assetName, int index) {
    final isSelected = _currentIndex == index;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: SvgPicture.asset(
        assetName,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.orange : AppColors.textGrey,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
