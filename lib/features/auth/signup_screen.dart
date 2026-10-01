import 'package:flutter/material.dart';
import 'auth_shell.dart';
import 'login_screen.dart';
import 'widgets/auth_button.dart';
import 'widgets/auth_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      title: 'Sign Up',
      subtitle: 'Please sign up to get started',
      showBack: true,
      onBack: () => Navigator.pop(context),
      child: Positioned.fill(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 257, 24, 0),
          child: Column(
            children: [
              const AuthTextField(
                label: 'NAME',
                hint: 'John doe',
              ),
              const SizedBox(height: 24),
              const AuthTextField(
                label: 'EMAIL',
                hint: 'example@gmail.com',
              ),
              const SizedBox(height: 24),
              const AuthTextField(
                label: 'PASSWORD',
                hint: '••••••••••',
                obscure: true,
              ),
              const SizedBox(height: 24),
              const AuthTextField(
                label: 'RE-TYPE PASSWORD',
                hint: '••••••••••',
                obscure: true,
              ),
              const SizedBox(height: 47),
              AuthButton(
                label: 'SIGN UP',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
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