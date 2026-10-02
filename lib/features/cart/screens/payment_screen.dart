import 'package:flutter/material.dart';
import 'package:food_app_depi/core/app_colors.dart';
import 'package:food_app_depi/core/app_string.dart';
import 'package:food_app_depi/features/cart/data/models/payment_method.dart';
import 'package:food_app_depi/features/cart/screens/payment_success_screen.dart';
import 'package:food_app_depi/features/cart/widgets/add_payment_method_button.dart';
import 'package:food_app_depi/features/cart/widgets/checkout_footer.dart';
import 'package:food_app_depi/features/cart/widgets/empty_card_panel.dart';
import 'package:food_app_depi/features/cart/widgets/payment_method_tile.dart';
import 'package:food_app_depi/features/cart/widgets/screen_header.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.total});

  final int total;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod _selectedMethod = PaymentMethod.mastercard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: AppString.paymentTitle,
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 92,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (final method in PaymentMethod.values)
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: PaymentMethodTile(
                                method: method,
                                selected: _selectedMethod == method,
                                onTap: () => setState(() {
                                  _selectedMethod = method;
                                }),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    const EmptyCardPanel(),
                    const SizedBox(height: 10),
                    AddPaymentMethodButton(onPressed: _showAddCardDialog),
                  ],
                ),
              ),
            ),
            CheckoutFooter(
              total: widget.total,
              label: AppString.payAndConfirm,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) =>
                      PaymentSuccessScreen(total: widget.total),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddCardDialog() async {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppString.addPaymentCardTitle),
        content: const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: AppString.cardNumber),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(AppString.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(AppString.save),
          ),
        ],
      ),
    );
  }
}
