import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    this.obscure = false,
    this.controller,
    this.keyboardType,
    this.autofocus = false,
    this.validator,
  });

  final String label;
  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool autofocus;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            height: 16 / 13,
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          autofocus: autofocus,
          validator: validator,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.text,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.placeholder,
            ),
            filled: true,
            fillColor: AppColors.field,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            suffixIcon: obscure
                ? const Icon(
                    Icons.visibility_off_outlined,
                    size: 16,
                    color: AppColors.placeholder,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
