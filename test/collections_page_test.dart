import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:union_shop/views/collections_page.dart';

void main() {
  testWidgets('CollectionsPage builds and shows title',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionsPage(),
      ),
    );

    // Page widget exists
    expect(find.byType(CollectionsPage), findsOneWidget);

    // AppBar title text
    expect(find.text('Collections'), findsOneWidget);
  });
}
