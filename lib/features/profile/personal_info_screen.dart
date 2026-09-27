import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_routes.dart';
import 'package:food_app_depi/core/app_string.dart';
import 'package:food_app_depi/core/widgets/circle_icon_button.dart';

class PersonalInfoScreen
    extends
        StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<
    PersonalInfoScreen
  >
  createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState
    extends
        State<
          PersonalInfoScreen
        > {
  String fullName = 'Vishal Khadok';
  String email = 'hello@halallab.co';
  String phoneNumber = '408-841-0926';
  String bio = 'I love fast food';

  Future<
    void
  >
  _openEdit() async {
    final result =
        await Navigator.of(
          context,
        ).pushNamed(
          AppRoutes.editProfile,
          arguments: {
            'fullName': fullName,
            'email': email,
            'phoneNumber': phoneNumber,
            'bio': bio,
          },
        );

    if (result is Map) {
      setState(() {
        fullName =
            result['fullName'] ??
            fullName;
        email =
            result['email'] ??
            email;
        phoneNumber =
            result['phoneNumber'] ??
            phoneNumber;
        bio =
            result['bio'] ??
            bio;
      });
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton.back(
                    context,
                  ),
                  Text(
                    AppString.personalInfo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  TextButton(
                    onPressed: _openEdit,
                    child: Text(
                      AppString.edit,
                      style: const TextStyle(
                        color: AppColors.primaryOrange,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 34,
                    backgroundColor: AppColors.peach,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        bio,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                ),
                child: Column(
                  children: [
                    _InfoRow(
                      icon: SvgPicture.asset(
                        'assets/icons/person.svg',
                        width: 18,
                        height: 18,
                      ),
                      label: AppString.fullName,
                      value: fullName,
                    ),
                    _InfoRow(
                      icon: SvgPicture.asset(
                        'assets/icons/mail.svg',
                        width: 18,
                        height: 18,
                      ),
                      label: AppString.email,
                      value: email,
                    ),
                    _InfoRow(
                      icon: SvgPicture.asset(
                        'assets/icons/call.svg',
                        width: 18,
                        height: 18,
                      ),
                      label: AppString.phoneNumber,
                      value: phoneNumber,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow
    extends
        StatelessWidget {
  final Widget icon;
  final String label;
  final String value;

  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  letterSpacing: 0.5,
                  color: AppColors.textGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
