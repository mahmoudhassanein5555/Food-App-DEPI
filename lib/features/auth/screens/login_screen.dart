import 'package:flutter/material.dart';
import 'package:food_app_depi/features/auth/data/auth_data.dart';
import '../../../core/utils/app_colors.dart';
import 'auth_shell.dart';
import 'forgot_password_screen.dart';
import 'signup_screen.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_buttons.dart';
import '../../home/screens/main_layout_screen.dart';
import 'package:food_app_depi/core/utils/app_string.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthShell(
        title: AppString.login,
        subtitle: AppString.loginSubtitle,
        child: Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 257, 24, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthTextField(
                    label: AppString.email,
                    hint: AppString.emailHint,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppString.emailRequired;
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return AppString.emailInvalid;
                      }
                      return null;
                    },
                    controller: emailController,
                  ),
                  const SizedBox(height: 24),
                  AuthTextField(
                    label: AppString.password,
                    hint: AppString.passwordHint,
                    obscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppString.passwordRequired;
                      }
                      if (value.length < 6) {
                        return AppString.passwordLengthError;
                      }
                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return AppString.passwordUppercaseError;
                      }
                      return null;
                    },
                    controller: passwordController,
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
                            border: Border.all(
                                color: const Color(0xFFE3EBF2), width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: remember
                              ? const Icon(Icons.check,
                                  size: 14, color: AppColors.orange)
                              : null,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        AppString.rememberMe,
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFF7E8A97)),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ForgotPasswordScreen()),
                          );
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const Text(
                          AppString.forgotPassword,
                          style:
                              TextStyle(fontSize: 14, color: AppColors.orange),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  AuthButton(
                    label: AppString.logInUpper,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (AuthData.authenticateUser(emailController.text,
                                passwordController.text) ==
                            true) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MainLayoutScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(AppString.invalidEmailOrPassword),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppString.dontHaveAccount,
                        style: TextStyle(fontSize: 16, color: AppColors.muted),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignupScreen()),
                          );
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const Text(
                          AppString.signUpUpper,
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
                    AppString.orStr,
                    style: TextStyle(fontSize: 16, color: AppColors.muted),
                  ),
                  const SizedBox(height: 15),
                  const SocialButtons(),
                ],
              ),
            ),
          ),
        ));
  }
}
