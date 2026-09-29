import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<Offset> _foodAnimation;
  late final Animation<Offset> _topLogoAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Food تطلع من تحت الشاشة
    _foodAnimation = Tween<Offset>(
      begin: const Offset(0, 20),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    // الجزء العلوي ينزل من فوق الشاشة
    _topLogoAnimation = Tween<Offset>(
      begin: const Offset(0, -30),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    // تشغيل الأنيميشن
    _controller.forward();

    // الانتقال للـ Login بعد 3 ثواني
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: Center(
        child: AspectRatio(
          aspectRatio: 375 / 812,
          child: Stack(
            children: [
              // ==========================================
              // الزخرفة الموجودة أعلى الشاشة
              // ==========================================
              Positioned(
                left: 0,
                top: 0,
                child: SvgPicture.asset(
                  'assets/icons/Ellipse 1005.svg',
                  width: 184,
                  height: 103,
                ),
              ),

              // ==========================================
              // الزخرفة البرتقالي الموجودة أسفل الشاشة
              // ==========================================
              Positioned(
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  'assets/icons/Ellipse 1006.svg',
                  width: 232,
                  height: 238,
                ),
              ),

              // ==========================================
              // اللوجو بالكامل
              // ==========================================
              Positioned(
                left: 0,
                right: 0,
                top: 377,
                child: Center(
                  child: SizedBox(
                    width: 122,
                    height: 60,
                    child: Stack(
                      children: [
                        // ----------------------------------
                        // كلمة Food
                        // ----------------------------------
                        Positioned(
                          left: 0,
                          top: 16,
                          child: SlideTransition(
                            position: _foodAnimation,
                            child: SvgPicture.asset(
                              'assets/icons/Logo.svg',
                              width: 122,
                              height: 44,
                            ),
                          ),
                        ),

                        // ----------------------------------
                        // الجزء البرتقالي فوق Food
                        // ----------------------------------
                        Positioned(
                          left: 39,
                          top: 0,
                          child: SlideTransition(
                            position: _topLogoAnimation,
                            child: SvgPicture.asset(
                              'assets/icons/logo top.svg',
                              width: 43,
                              height: 27,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}