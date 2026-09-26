import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_string.dart';
import 'package:food_app_depi/core/widgets/circle_icon_button.dart';

class EditProfileScreen
    extends
        StatefulWidget {
  final Map<
    String,
    dynamic
  >?
  initialData;

  const EditProfileScreen({super.key, this.initialData});

  @override
  State<
    EditProfileScreen
  >
  createState() => _EditProfileScreenState();
}

class _EditProfileScreenState
    extends
        State<
          EditProfileScreen
        > {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    final data =
        widget.initialData ??
        {};
    _nameController = TextEditingController(
      text:
          data['fullName'] ??
          '',
    );
    _emailController = TextEditingController(
      text:
          data['email'] ??
          '',
    );
    _phoneController = TextEditingController(
      text:
          data['phoneNumber'] ??
          '',
    );
    _bioController = TextEditingController(
      text:
          data['bio'] ??
          '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _save() {
    Navigator.of(
      context,
    ).pop({
      'fullName': _nameController.text,
      'email': _emailController.text,
      'phoneNumber': _phoneController.text,
      'bio': _bioController.text,
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable content (header + avatar + fields). Only this part
            // scrolls if the content is taller than the screen or the
            // keyboard is open — the Save button below stays put.
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        CircleIconButton.back(
                          context,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          AppString.editProfile,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 48,
                            backgroundColor: AppColors.peach,
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryOrange,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/icons/pin.svg',
                                width: 14,
                                height: 14,
                                // The exported pencil is orange — force it
                                // white here so it stays visible against the
                                // orange badge background.
                                colorFilter: const ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    _FieldLabel(
                      AppString.fullName,
                    ),
                    _FormField(
                      controller: _nameController,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    _FieldLabel(
                      AppString.email,
                    ),
                    _FormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    _FieldLabel(
                      AppString.phoneNumber,
                    ),
                    _FormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    _FieldLabel(
                      AppString.bio,
                    ),
                    _FormField(
                      controller: _bioController,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            // Fixed footer — always pinned to the bottom of the screen,
            // matching the Figma design, instead of scrolling with the form.
            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                12,
                20,
                20,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryOrange,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        14,
                      ),
                    ),
                  ),
                  child: Text(
                    AppString.save,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FieldLabel
    extends
        StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w600,
          color: AppColors.textGrey,
        ),
      ),
    );
  }
}

class _FormField
    extends
        StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int maxLines;

  const _FormField({required this.controller, this.keyboardType, this.maxLines = 1});

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(
        color: AppColors.textDark,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.card,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
