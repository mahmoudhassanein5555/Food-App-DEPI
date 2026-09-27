import 'package:flutter/material.dart';
import 'auth_shell.dart';
import 'verification_screen.dart';
import 'widgets/auth_button.dart';
import 'widgets/auth_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      title: 'Forgot Password',
      subtitle: 'Please sign in to your existing account',
      showBack: true,
      onBack: () => Navigator.pop(context),
      child: Positioned.fill(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 257, 24, 0),
          child: Column(
            children: [
              const AuthTextField(
                label: 'EMAIL',
                hint: 'example@gmail.com',
              ),
              const SizedBox(height: 24),
              AuthButton(
                label: 'SEND CODE',
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