import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:union_shop/views/about_page.dart';

void main() {
  testWidgets('AboutPage builds and shows its content',
      (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));

    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    await tester.pumpAndSettle();

    // AppBar title
    expect(find.text('About Us'), findsNWidgets(2)); // AppBar + heading

    // Description starts with this text
    expect(
      find.textContaining('Welcome to the Union Shop! We are dedicated'),
      findsOneWidget,
    );

    // Contact line
    expect(
      find.text('Contact us at unionshop@upsu.net'),
      findsOneWidget,
    );
  });
}
