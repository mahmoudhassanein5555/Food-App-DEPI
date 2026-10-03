import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_string.dart';

enum PaymentMethod {
  cash(AppString.cash, Icons.payments_outlined),
  visa(AppString.visa, Icons.credit_card),
  mastercard(AppString.mastercard, Icons.circle),
  paypal(AppString.paypal, Icons.account_balance_wallet_outlined);

  const PaymentMethod(this.label, this.icon);

  final String label;
  final IconData icon;
}
