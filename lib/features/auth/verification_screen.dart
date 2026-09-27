import 'package:flutter/material.dart';

import 'auth_shell.dart';
import 'widgets/auth_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final focusNodes = List.generate(
    4,
    (_) => FocusNode(),
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }

    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  void _handleChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        focusNodes[index + 1].requestFocus();
      } else {
        FocusScope.of(context).unfocus();
      }
    }
  }

  void _handleTap(int index) {
    controllers[index].selection = TextSelection.fromPosition(
      TextPosition(
        offset: controllers[index].text.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      title: 'Verification',
      subtitle: 'We have sent a code to your email',
      showBack: true,
      onBack: () => Navigator.pop(context),
      child: Positioned.fill(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            24,
            184,
            24,
            0,
          ),
          child: Column(
            children: [
              const Text(
                'example@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 48),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) {
                    return SizedBox(
                      width: 62,
                      height: 62,
                      child: TextField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        autofocus: index == 0,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        textInputAction: index == 3
                            ? TextInputAction.done
                            : TextInputAction.next,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2D3142),
                        ),
                        onTap: () {
                          _handleTap(index);
                        },
                        onChanged: (value) {
                          _handleChanged(
                            value,
                            index,
                          );
                        },
                        onSubmitted: (_) {
                          if (index < 3) {
                            focusNodes[index + 1].requestFocus();
                          } else {
                            FocusScope.of(context).unfocus();
                          }
                        },
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: const Color(0xFFF0F5FA),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 45),

              AuthButton(
                label: 'VERIFY',
                onPressed: () {
                  final code = controllers
                      .map((controller) => controller.text)
                      .join();

                  debugPrint(
                    'Verification code: $code',
                  );

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}