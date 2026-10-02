import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          image: 'assets/icons/facebook icon.svg',
          onTap: () {
            debugPrint('Facebook');
          },
        ),

        const SizedBox(width: 30),

        _SocialButton(
          image: 'assets/icons/twiter icon.svg',
          onTap: () {
            debugPrint('Twitter');
          },
        ),

        const SizedBox(width: 31),

        // _SocialButton(
        //   image: 'assets/icons/Group 8187.svg',
        //   onTap: () {
        //     debugPrint('Apple');
        //   },
        // ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const _SocialButton({
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        image,
        width: 62,
        height: 62,
      ),
    );
  }
}