import 'package:flutter/material.dart';

import 'widgets/auth_background.dart';

class AuthShell extends StatelessWidget {
  const AuthShell({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.showBack = false,
    this.onBack,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final bool showBack;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: AspectRatio(
          aspectRatio: 375 / 812,
          child: Stack(
            children: [
              AuthBackground(
                showBack: false,
                onBack: null,
              ),

              // Back button
              if (showBack)
                Positioned(
                  left: 24,
                  top: 48,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onBack,
                      borderRadius: BorderRadius.circular(24),
                      child: const SizedBox(
                        width: 48,
                        height: 48,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),

              // White content area
              Positioned(
                left: 0,
                right: 0,
                top: 233,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                ),
              ),

              // Title + subtitle
              Positioned(
                left: 0,
                right: 0,
                top: 112,
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        height: 36 / 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 26 / 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Screen content
              Positioned.fill(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}