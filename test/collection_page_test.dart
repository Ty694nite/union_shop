import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:union_shop/views/collection_page.dart';

void main() {
  testWidgets('CollectionPage builds and shows its title',
      (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));

    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionPage(collectionName: 'Test Collection'),
      ),
    );

    await tester.pumpAndSettle();

    // Page and Scaffold exist
    expect(find.byType(CollectionPage), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);

    // AppBar shows the collection name
    expect(find.text('Test Collection'), findsOneWidget);
  });
}
