import 'package:flutter/material.dart';
import 'package:food_app_depi/features/auth/data/auth_data.dart';
import 'package:food_app_depi/features/auth/data/models/user_model.dart';
import 'auth_shell.dart';
import 'login_screen.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';
import 'package:food_app_depi/core/utils/app_string.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      title: AppString.signUp,
      subtitle: AppString.signupSubtitle,
      showBack: true,
      onBack: () => Navigator.pop(context),
      child: Positioned.fill(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 257, 24, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AuthTextField(
                  label: AppString.name,
                  hint: 'John doe',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppString.nameRequired;
                    }
                    return null;
                  },
                  controller: _nameController,
                ),
                const SizedBox(height: 24),
                AuthTextField(
                  label: AppString.email,
                  hint: AppString.emailHint,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppString.emailRequired;
                    }
                    if (!value.contains('@')) {
                      return AppString.emailInvalid;
                    }
                    return null;
                  },
                  controller: _emailController,
                ),
                const SizedBox(height: 24),
                AuthTextField(
                  controller: _passwordController,
                  label: AppString.password,
                  hint: '••••••••••',
                  obscure: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppString.passwordRequired;
                    }
                    if (value.length < 6) {
                      return AppString.passwordLengthError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                AuthTextField(
                  controller: _confirmPasswordController,
                  label: AppString.retypePassword,
                  hint: '••••••••••',
                  obscure: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return AppString.passwordsDoNotMatch;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 47),
                AuthButton(
                  label: AppString.signUpUpper,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      AuthData.addUser(
                        UserModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          email: _emailController.text,
                          name: _nameController.text,
                          password: _passwordController.text,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Account created successfully! Please log in.')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
