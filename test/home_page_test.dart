import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:union_shop/views/home_page.dart';

void main() {
  testWidgets('HomePage builds and shows key sections',
      (WidgetTester tester) async {
    // Simulate a phone-sized screen
    await tester.binding.setSurfaceSize(const Size(400, 800));

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    await tester.pumpAndSettle();

    // Header texts
    expect(find.text('UNION SHOP'), findsOneWidget);
    expect(find.text("Portsmouth Students' Union"), findsOneWidget);

    // Section titles
    expect(find.text('Essential range'), findsOneWidget);
    expect(find.text('Signature range'), findsOneWidget);
    expect(find.text('Portsmouth City Collection'), findsOneWidget);

    // Footer headings
    expect(find.text('Opening Hours'), findsOneWidget);
    expect(find.text('Contact Us'), findsOneWidget);
    expect(find.text('Location'), findsOneWidget);
  });
}
