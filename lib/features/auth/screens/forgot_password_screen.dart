import 'package:flutter/material.dart';
import 'auth_shell.dart';
import 'verification_screen.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';
import 'package:food_app_depi/core/utils/app_string.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AuthTextField(
                  label: AppString.email,
                  hint: AppString.emailHint,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    final email = value?.trim() ?? '';
                    if (email.isEmpty) {
                      return AppString.emailRequired;
                    }
                    if (!email.contains('@') || !email.contains('.')) {
                      return AppString.emailInvalid;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                AuthButton(
                  label: AppString.sendCode,
                  onPressed: () {
                    if (!(_formKey.currentState?.validate() ?? false)) {
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VerificationScreen(
                          email: _emailController.text.trim(),
                        ),
                      ),
                    );
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