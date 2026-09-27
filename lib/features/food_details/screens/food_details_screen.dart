import 'package:flutter/material.dart';
import '../../../core/home_ui_colors.dart';
import '../../../core/app_icons.dart';
import '../../../core/models/app_models.dart';
import '../../../core/widgets/circle_icon_button.dart';
import '../../../core/widgets/rating_info_row.dart';

class FoodDetailsScreen extends StatefulWidget {
  final FoodItem item;

  const FoodDetailsScreen({super.key, required this.item});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  static const _sizes = ['10"', '14"', '16"'];
  int _selectedSizeIndex = 1;
  int _quantity = 2;
  bool _isFavorite = false;

  double get _unitPrice => widget.item.price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeUiColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildHeroImage(context),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: HomeUiColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(AppIcons.location, size: 15, color: HomeUiColors.locationPin),
                            const SizedBox(width: 4),
                            Text(
                              widget.item.restaurantName,
                              style: const TextStyle(fontSize: 13, color: HomeUiColors.textMuted),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const RatingInfoRow(rating: 4.7, freeDelivery: true, timeMinutes: 20),
                        const SizedBox(height: 14),
                        Text(
                          widget.item.description ??
                              'Maecenas dolor eget risus varius blandit sit amet non magna. '
                                  'Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.5,
                            color: HomeUiColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'SIZE:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: HomeUiColors.textMuted,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildSizeSelector(),
                        const SizedBox(height: 18),
                        const Text(
                          'INGREDIENTS',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: HomeUiColors.textMuted,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildIngredients(),
                        const SizedBox(height: 110), // room for bottom bar
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildHeroImage(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(28)),
          child: Container(
            width: double.infinity,
            height: 300,
            color: HomeUiColors.imagePlaceholder,
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: CircleIconButton(
            icon: AppIcons.back,
            backgroundColor: HomeUiColors.surface,
            iconColor: HomeUiColors.textPrimary,
            onTap: () => Navigator.pop(context),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: CircleIconButton(
            icon: _isFavorite ? AppIcons.favoriteFilled : AppIcons.favoriteOutline,
            backgroundColor: HomeUiColors.surface,
            iconColor: HomeUiColors.favorite,
            onTap: () => setState(() => _isFavorite = !_isFavorite),
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    return Row(
      children: List.generate(_sizes.length, (index) {
        final selected = index == _selectedSizeIndex;
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () => setState(() => _selectedSizeIndex = index),
            child: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? HomeUiColors.primaryLight : HomeUiColors.chipUnselectedBg,
              ),
              child: Text(
                _sizes[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: selected ? Colors.white : HomeUiColors.textSecondary,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildIngredients() {
    return Row(
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: HomeUiColors.chipUnselectedBg,
              shape: BoxShape.circle,
            ),
            child: const Icon(AppIcons.ingredientAllergen, size: 18, color: HomeUiColors.primary),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final total = _unitPrice; // extend with size multiplier if needed
    return Container(
      padding: EdgeInsets.fromLTRB(20, 14, 20, 14 + MediaQuery.of(context).padding.bottom),
      decoration: const BoxDecoration(
        color: HomeUiColors.surface,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: HomeUiColors.textPrimary,
                ),
              ),
              _buildQuantityStepper(),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Added $_quantity x ${widget.item.name} to cart')),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: HomeUiColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text(
                'ADD TO CART',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityStepper() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: HomeUiColors.primaryDark,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          _stepperButton(AppIcons.minusButton, () {
            if (_quantity > 1) setState(() => _quantity--);
          }),
          SizedBox(
            width: 26,
            child: Text(
              '$_quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          _stepperButton(AppIcons.addButton, () => setState(() => _quantity++)),
        ],
      ),
    );
  }

  Widget _stepperButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        alignment: Alignment.center,
        child: Icon(icon, size: 14, color: Colors.white),
      ),
    );
  }
}
