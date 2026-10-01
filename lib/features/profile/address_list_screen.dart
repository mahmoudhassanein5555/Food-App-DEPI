import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_routes.dart';
import 'package:food_app_depi/core/app_string.dart';
import 'package:food_app_depi/core/models/address_model.dart';
import 'package:food_app_depi/core/widgets/circle_icon_button.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({super.key});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  final List<AddressModel> _addresses = [
    const AddressModel(
      id: '1',
      label: AddressLabel.home,
      fullAddress: '2464 Royal Ln. Mesa, New Jersey 45463',
      street: 'Royal Ln.',
      postCode: '45463',
      apartment: '',
    ),
    const AddressModel(
      id: '2',
      label: AddressLabel.work,
      fullAddress: '3891 Ranchview Dr. Richardson, California 62639',
      street: 'Ranchview Dr.',
      postCode: '62639',
      apartment: '',
    ),
  ];

  Future<void> _openAddOrEdit({
    AddressModel? existing,
  }) async {
    final result = await Navigator.of(
      context,
    ).pushNamed(
      AppRoutes.addEditAddress,
      arguments: existing,
    );

    if (result is AddressModel) {
      setState(() {
        final index = _addresses.indexWhere(
          (
            a,
          ) =>
              a.id == result.id,
        );
        if (index == -1) {
          _addresses.add(
            result,
          );
        } else {
          _addresses[index] = result;
        }
      });
    }
  }

  void _delete(
    AddressModel address,
  ) {
    setState(
      () => _addresses.removeWhere(
        (
          a,
        ) =>
            a.id == address.id,
      ),
    );
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
                children: [
                  CircleIconButton.back(
                    context,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    AppString.myAddress,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: _addresses.length,
                  separatorBuilder: (
                    _,
                    __,
                  ) =>
                      const SizedBox(
                    height: 14,
                  ),
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    final address = _addresses[index];
                    return _AddressCard(
                      address: address,
                      onEdit: () => _openAddOrEdit(
                        existing: address,
                      ),
                      onDelete: () => _delete(
                        address,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _openAddOrEdit(),
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
                  child: const Text(
                    AppString.addNewAddress,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _labelIcon(
  AddressLabel label,
) {
  switch (label) {
    case AddressLabel.home:
      return SvgPicture.asset(
        'assets/icons/home.svg',
        width: 20,
        height: 20,
      );
    case AddressLabel.work:
      return SvgPicture.asset(
        'assets/icons/work.svg',
        width: 20,
        height: 20,
      );
    case AddressLabel.other:
      return const Icon(
        Icons.location_on_outlined,
        color: AppColors.primaryOrange,
        size: 20,
      );
  }
}

class _AddressCard extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _AddressCard({required this.address, required this.onEdit, required this.onDelete});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(
        14,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: _labelIcon(
              address.label,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.label.text.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 11,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textGrey,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  address.fullAddress,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onEdit,
            icon: SvgPicture.asset(
              'assets/icons/edit.svg',
              width: 18,
              height: 18,
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: SvgPicture.asset(
              'assets/icons/delete.svg',
              width: 18,
              height: 18,
            ),
          ),
        ],
      ),
    );
  }
}
