import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';

enum AddressLabel {
  home,
  work,
  other,
}

extension AddressLabelX
    on
        AddressLabel {
  String get text {
    switch (this) {
      case AddressLabel.home:
        return 'Home';
      case AddressLabel.work:
        return 'Work';
      case AddressLabel.other:
        return 'Other';
    }
  }

  IconData get icon {
    switch (this) {
      case AddressLabel.home:
        return Icons.home_outlined;
      case AddressLabel.work:
        return Icons.work_outline;
      case AddressLabel.other:
        return Icons.location_on_outlined;
    }
  }

  Color get iconColor {
    switch (this) {
      case AddressLabel.home:
        return AppColors.blue;
      case AddressLabel.work:
        return AppColors.purple;
      case AddressLabel.other:
        return AppColors.primaryOrange;
    }
  }
}

class AddressModel {
  final String id;
  final AddressLabel label;
  final String fullAddress;
  final String street;
  final String postCode;
  final String apartment;

  const AddressModel({required this.id, required this.label, required this.fullAddress, required this.street, required this.postCode, required this.apartment});

  AddressModel copyWith({
    AddressLabel? label,
    String? fullAddress,
    String? street,
    String? postCode,
    String? apartment,
  }) {
    return AddressModel(
      id: id,
      label:
          label ??
          this.label,
      fullAddress:
          fullAddress ??
          this.fullAddress,
      street:
          street ??
          this.street,
      postCode:
          postCode ??
          this.postCode,
      apartment:
          apartment ??
          this.apartment,
    );
  }
}
