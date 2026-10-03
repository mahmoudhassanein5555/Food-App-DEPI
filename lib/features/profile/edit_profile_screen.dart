import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/utils/app_string.dart';
import 'package:food_app_depi/core/widgets/circle_icon_button.dart';

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic>? initialData;

  const EditProfileScreen({super.key, this.initialData});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _bioController;
  final ImagePicker _imagePicker = ImagePicker();
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    final data = widget.initialData ?? {};
    _imagePath = data['imagePath'];
    _nameController = TextEditingController(
      text: data['fullName'] ?? '',
    );
    _emailController = TextEditingController(
      text: data['email'] ?? '',
    );
    _phoneController = TextEditingController(
      text: data['phoneNumber'] ?? '',
    );
    _bioController = TextEditingController(
      text: data['bio'] ?? '',
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
      'imagePath': _imagePath,
    });
  }

  Future<void> _changeProfilePicture() async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Take a photo'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );

    if (source == null) return;

    final image = await _imagePicker.pickImage(
      source: source,
      imageQuality: 85,
    );
    if (image != null && mounted) {
      setState(() => _imagePath = image.path);
    }
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
                        const Text(
                          AppString.editProfile,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.text,
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
                          CircleAvatar(
                            radius: 48,
                            backgroundColor: AppColors.peach,
                            backgroundImage: _imagePath == null
                                ? null
                                : FileImage(File(_imagePath!)),
                          ),
                          Positioned(
                            right: -9,
                            bottom: -9,
                            child: IconButton(
                              tooltip: 'Change profile picture',
                              onPressed: _changeProfilePicture,
                              icon: const CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.orange,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 15,
                                  color: AppColors.white,
                                ),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    const _FieldLabel(
                      AppString.fullName,
                    ),
                    _FormField(
                      controller: _nameController,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const _FieldLabel(
                      AppString.email,
                    ),
                    _FormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const _FieldLabel(
                      AppString.phoneNumber,
                    ),
                    _FormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const _FieldLabel(
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
                    backgroundColor: AppColors.orange,
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
                  child: const Text(
                    AppString.save,
                    style: TextStyle(
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

class _FieldLabel extends StatelessWidget {
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

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int maxLines;

  const _FormField(
      {required this.controller, this.keyboardType, this.maxLines = 1});

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(
        color: AppColors.text,
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
