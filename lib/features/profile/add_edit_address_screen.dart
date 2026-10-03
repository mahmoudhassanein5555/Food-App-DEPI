import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/utils/app_string.dart';
import 'package:food_app_depi/core/mock_data/models/address_model.dart';
import 'package:food_app_depi/core/widgets/circle_icon_button.dart';

class AddEditAddressScreen
    extends
        StatefulWidget {
  final AddressModel? existing;

  const AddEditAddressScreen({super.key, this.existing});

  @override
  State<
    AddEditAddressScreen
  >
  createState() => _AddEditAddressScreenState();
}

class _AddEditAddressScreenState
    extends
        State<
          AddEditAddressScreen
        > {
  late final TextEditingController _addressController;
  late final TextEditingController _streetController;
  late final TextEditingController _postCodeController;
  late final TextEditingController _apartmentController;
  late AddressLabel _selectedLabel;

  @override
  void initState() {
    super.initState();
    final existing = widget.existing;
    _addressController = TextEditingController(
      text:
          existing?.fullAddress ??
          '',
    );
    _streetController = TextEditingController(
      text:
          existing?.street ??
          '',
    );
    _postCodeController = TextEditingController(
      text:
          existing?.postCode ??
          '',
    );
    _apartmentController = TextEditingController(
      text:
          existing?.apartment ??
          '',
    );
    _selectedLabel =
        existing?.label ??
        AddressLabel.home;
  }

  @override
  void dispose() {
    _addressController.dispose();
    _streetController.dispose();
    _postCodeController.dispose();
    _apartmentController.dispose();
    super.dispose();
  }

  void _save() {
    final address = AddressModel(
      id:
          widget.existing?.id ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      label: _selectedLabel,
      fullAddress: _addressController.text,
      street: _streetController.text,
      postCode: _postCodeController.text,
      apartment: _apartmentController.text,
    );
    Navigator.of(
      context,
    ).pop(
      address,
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: 280,
                    child: Stack(
                      children: [
                        Container(
                          color: AppColors.placeholder,
                        ),
                        Positioned(
                          top: 48,
                          left: 20,
                          child: SafeArea(
                            bottom: false,
                            child: CircleIconButton(
                              icon: Icons.chevron_left,
                              background: AppColors.textDarkest,
                              iconColor: AppColors.white,
                              onTap: () => Navigator.of(
                                context,
                              ).maybePop(),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.textDarkest,
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                ),
                                child: const Text(
                                  AppString.moveToEditLocation,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                width: 22,
                                height: 22,
                                decoration: const BoxDecoration(
                                  color: AppColors.orange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      20,
                      20,
                      8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _FieldLabel(
                          AppString.address,
                        ),
                        _FormField(
                          controller: _addressController,
                          prefixIcon: SvgPicture.asset(
                            'assets/icons/location_pin.svg',
                            width: 16,
                            height: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const _FieldLabel(
                                    AppString.street,
                                  ),
                                  _FormField(
                                    controller: _streetController,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const _FieldLabel(
                                    AppString.postCode,
                                  ),
                                  _FormField(
                                    controller: _postCodeController,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const _FieldLabel(
                          AppString.appartment,
                        ),
                        _FormField(
                          controller: _apartmentController,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const _FieldLabel(
                          AppString.labelAs,
                        ),
                        Row(
                          children: AddressLabel.values.map((
                            label,
                          ) {
                            final selected =
                                label ==
                                _selectedLabel;
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: ChoiceChip(
                                label: Text(
                                  label.text,
                                ),
                                selected: selected,
                                onSelected:
                                    (
                                      _,
                                    ) {
                                      setState(
                                        () => _selectedLabel = label,
                                      );
                                    },
                                selectedColor: AppColors.orange,
                                backgroundColor: AppColors.card,
                                labelStyle: TextStyle(
                                  color: selected
                                      ? AppColors.white
                                      : AppColors.text,
                                  fontWeight: FontWeight.w600,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                  side: BorderSide.none,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
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
                    AppString.saveLocation,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
  final Widget? prefixIcon;

  const _FormField({required this.controller, this.prefixIcon});

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: AppColors.text,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.card,
        prefixIcon:
            prefixIcon ==
                null
            ? null
            : Padding(
                padding: const EdgeInsets.all(
                  14,
                ),
                child: prefixIcon,
              ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
        ),
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
