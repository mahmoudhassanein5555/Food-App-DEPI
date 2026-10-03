import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/widgets/circle_icon_button.dart';

class RestaurantImageCarousel extends StatefulWidget {
  final String imageUrl;

  const RestaurantImageCarousel({super.key, required this.imageUrl});

  @override
  State<RestaurantImageCarousel> createState() => _RestaurantImageCarouselState();
}

class _RestaurantImageCarouselState extends State<RestaurantImageCarousel> {
  final _pageController = PageController();
  int _activePage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 260,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _activePage = i),
            itemCount: 3,
            itemBuilder: (context, index) =>
                Image.asset(widget.imageUrl, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: CircleIconButton(
            icon: 'assets/icons/arrow_left.svg',
            backgroundColor: AppColors.white,
            iconColor: AppColors.textDarkest,
            onTap: () => Navigator.pop(context),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  'assets/icons/more.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColors.textDarkest,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: _activePage == index ? 18 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: _activePage == index ? Colors.white : Colors.white54,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
