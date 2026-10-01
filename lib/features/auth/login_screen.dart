import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import 'auth_shell.dart';
import 'forgot_password_screen.dart';
import 'signup_screen.dart';
import 'widgets/auth_button.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/social_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      title: 'Log In',
      subtitle: 'Please sign in to your existing account',
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
              const AuthTextField(
                label: 'PASSWORD',
                hint: '123456789',
                obscure: true,
              ),
              const SizedBox(height: 23),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => remember = !remember),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFE3EBF2), width: 2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: remember
                          ? const Icon(Icons.check, size: 14, color: AppColors.orange)
                          : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'REMEMBER ME',
                    style: TextStyle(fontSize: 13, color: Color(0xFF7E8A97)),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
                      );
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Text(
                      'FORGOT PASSWORD',
                      style: TextStyle(fontSize: 14, color: AppColors.orange),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              AuthButton(
                label: 'LOG IN',
                onPressed: () {},
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16, color: AppColors.muted),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      );
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Or',
                style: TextStyle(fontSize: 16, color: AppColors.muted),
              ),
              const SizedBox(height: 15),
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}