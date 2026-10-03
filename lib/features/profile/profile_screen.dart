import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/utils/app_routes.dart';
import 'package:food_app_depi/core/utils/app_string.dart';
import 'package:food_app_depi/core/widgets/circle_icon_button.dart';
import 'package:food_app_depi/features/profile/widgets/profile_menu_tile.dart';
import 'package:food_app_depi/features/cart/screens/cart_screen.dart';
import 'package:food_app_depi/features/cart/screens/payment_screen.dart';
import 'package:food_app_depi/features/auth/screens/login_screen.dart';
Widget
_svgIcon(
  String name,
) => SvgPicture.asset(
  'assets/icons/$name.svg',
  width: 20,
  height: 20,
);

class ProfileScreen
    extends
        StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton.back(
                    context,
                  ),
                  const Text(
                    AppString.profile,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.text,
                    ),
                  ),
                  CircleIconButton(
                    icon: Icons.more_horiz,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 34,
                    backgroundColor: AppColors.peach,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vishal Khadok',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.text,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'I love fast food',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: ListView(
                  children: [
                    ProfileMenuGroup(
                      tiles: [
                        ProfileMenuTile(
                          icon: _svgIcon(
                            'person',
                          ),
                          label: AppString.personalInfo,
                          onTap: () =>
                              Navigator.of(
                                context,
                              ).pushNamed(
                                AppRoutes.personalInfo,
                              ),
                        ),
                        ProfileMenuTile(
                          icon: _svgIcon(
                            'map',
                          ),
                          label: AppString.addresses,
                          onTap: () =>
                              Navigator.of(
                                context,
                              ).pushNamed(
                                AppRoutes.addressList,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ProfileMenuGroup(
                      tiles: [
                        ProfileMenuTile(
                          icon: _svgIcon(
                            'bag',
                          ),
                          label: AppString.cart,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CartScreen()),
                          ),
                        ),
                        ProfileMenuTile(
                          icon: _svgIcon(
                            'heart',
                          ),
                          label: AppString.favourite,
                        ),
                        ProfileMenuTile(
                          icon: _svgIcon(
                            'bell',
                          ),
                          label: AppString.notifications,
                        ),
                        ProfileMenuTile(
                          icon: _svgIcon(
                            'payment',
                          ),
                          label: AppString.paymentMethod,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const PaymentScreen(total: 0)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ProfileMenuGroup(
                      tiles: [
                        ProfileMenuTile(
                          icon: _svgIcon(
                            'help',
                          ),
                          label: AppString.faqs,
                        ),
                        ProfileMenuTile(
                          icon: _svgIcon(
                            'reviews',
                          ),
                          label: AppString.userReviews,
                        ),
                        ProfileMenuTile(
                          icon: _svgIcon(
                            'settings',
                          ),
                          label: AppString.settings,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ProfileMenuGroup(
                      tiles: [
                        ProfileMenuTile(
                          icon: _svgIcon(
                            'logout',
                          ),
                          label: AppString.logOut,
                          onTap: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const LoginScreen()),
                            (route) => false,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
