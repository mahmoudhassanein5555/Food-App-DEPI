import 'package:flutter_test/flutter_test.dart';

import 'package:food_app_depi/main.dart';

void main() {
  testWidgets('cart flow moves through payment to confirmation', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Cart'), findsOneWidget);
    expect(find.text('Pizza Calzone European'), findsNWidgets(2));

    await tester.tap(find.text('PLACE ORDER'));
    await tester.pumpAndSettle();
    expect(find.text('Payment'), findsOneWidget);

    await tester.tap(find.text('PAY & CONFIRM'));
    await tester.pumpAndSettle();
    expect(find.text('Congratulations!'), findsOneWidget);
  });
}
