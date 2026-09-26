import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:food_app_depi/features/cart/screens/cart_screen.dart';
import 'package:food_app_depi/main.dart';

void main() {
  testWidgets('cart flow moves through payment to confirmation', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: CartScreen()));

    expect(find.text('Cart'), findsOneWidget);
    expect(find.text('Pizza Calzone European'), findsNWidgets(2));

    await tester.tap(find.text('PLACE ORDER'));
    await tester.pumpAndSettle();
    expect(find.text('Payment'), findsOneWidget);

    await tester.tap(find.text('PAY & CONFIRM'));
    await tester.pumpAndSettle();
    expect(find.text('Congratulations!'), findsOneWidget);
  });

  testWidgets('orders screen switches between ongoing and history', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('My Orders'), findsOneWidget);
    expect(find.text('Pizza Hut'), findsOneWidget);
    expect(find.text('Track Order'), findsNWidgets(3));

    await tester.tap(find.text('History'));
    await tester.pumpAndSettle();

    expect(find.text('Completed'), findsNWidgets(2));
    expect(find.text('Canceled'), findsOneWidget);
    expect(find.text('Re-Order'), findsNWidgets(3));
  });
}
