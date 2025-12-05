import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:union_shop/views/product_page.dart';

void main() {
  testWidgets('ProductPage builds and shows key UI parts',
      (WidgetTester tester) async {
    // Simulate a phone-sized screen
    await tester.binding.setSurfaceSize(const Size(400, 800));

    await tester.pumpWidget(
      const MaterialApp(
        home: ProductPage(),
      ),
    );

    await tester.pumpAndSettle();

    // Header banner
    expect(find.text('PRODUCT'), findsOneWidget);

    // Footer text
    expect(find.text('T&Cs apply'), findsOneWidget);

    // Description heading and body
    expect(find.text('Description'), findsOneWidget);
    expect(
      find.text('Beautifully designed T-Shirt made to match any outfit!'),
      findsOneWidget,
    );

    // Size dropdown and Add to Cart button
    expect(find.byType(DropdownButton<String>), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);
  });
}
