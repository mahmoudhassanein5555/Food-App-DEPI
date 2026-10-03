import 'package:flutter/material.dart';
import 'auth_shell.dart';
import 'verification_screen.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';
import 'package:food_app_depi/core/utils/app_string.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      title: AppString.forgotPasswordTitle,
      subtitle: AppString.loginSubtitle,
      showBack: true,
      onBack: () => Navigator.pop(context),
      child: Positioned.fill(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 257, 24, 0),
          child: Column(
            children: [
              const AuthTextField(
                label: AppString.email,
                hint: AppString.emailHint,
              ),
              const SizedBox(height: 24),
              AuthButton(
                label: AppString.sendCode,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const VerificationScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}