// Basic smoke test for the app's current home screen (Profile).
// The old counter-demo test was removed because MyHomePage/_counter no
// longer exist now that the Profile flow is wired in as home.

import 'package:flutter_test/flutter_test.dart';

import 'package:food_app_depi/main.dart';

void
main() {
  testWidgets(
    'Profile screen loads and shows the menu items',
    (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MyApp(),
      );

      expect(
        find.text(
          'Profile',
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          'Personal Info',
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          'Addresses',
        ),
        findsOneWidget,
      );

      await tester.tap(
        find.text(
          'Personal Info',
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text(
          'EDIT',
        ),
        findsOneWidget,
      );
    },
  );
}
