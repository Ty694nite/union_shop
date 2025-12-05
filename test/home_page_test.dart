import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:union_shop/views/home_page.dart';
import 'package:union_shop/view_models/home_view_model.dart';

/// Simple dummy product page used for navigation tests.
class _DummyProductPage extends StatelessWidget {
  const _DummyProductPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Product Page')),
    );
  }
}

void main() {
  group('HomePage basic layout', () {
    testWidgets('shows header text and sections', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      // Header texts
      expect(find.text('UNION SHOP'), findsOneWidget);
      expect(find.text("Portsmouth Students' Union"), findsOneWidget);

      // Section titles
      expect(find.text('Essential range'), findsOneWidget);
      expect(find.text('Signature range'), findsOneWidget);
      expect(find.text('Portsmouth City Collection'), findsOneWidget);

      // Footer bits
      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Contact Us'), findsOneWidget);
      expect(find.text('Location'), findsOneWidget);
    });

    testWidgets('renders essential products in grid',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      final products = HomeViewModel().getProducts();
      // Check that at least the first product title is present
      expect(find.text(products.first.title), findsWidgets);
    });

    testWidgets('renders signature products in grid',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      final products = HomeViewModel().getSignatureProducts();
      expect(find.text(products.first.title), findsWidgets);
    });

    testWidgets('renders city collection products in grid',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      final products = HomeViewModel().getCityCollectionProducts();
      expect(find.text(products.first.title), findsWidgets);
    });
  });

  group('HomePage navigation', () {
    testWidgets('tapping a product navigates to /product',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => const HomePage(),
            '/product': (context) => const _DummyProductPage(),
          },
          initialRoute: '/',
        ),
      );

      await tester.pumpAndSettle();

      // Tap the first product title from the essential range
      final firstProduct = HomeViewModel().getProducts().first;
      final productTitleFinder = find.text(firstProduct.title).first;
      expect(productTitleFinder, findsOneWidget);

      await tester.tap(productTitleFinder);
      await tester.pumpAndSettle();

      // We should now be on the dummy product page
      expect(find.text('Product Page'), findsOneWidget);
    });
  });

  group('HomePage responsive navbar', () {
    testWidgets('shows full navbar on wide screens',
        (WidgetTester tester) async {
      // Wide layout
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Desktop / tablet: should see these text buttons in the row
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Sale'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('The Print Shack'), findsOneWidget);

      // Menu icon should NOT be present in full navbar mode
      expect(find.byIcon(Icons.menu), findsNothing);
    });

    testWidgets('shows menu icon and uses drawer on narrow screens',
        (WidgetTester tester) async {
      // Narrow layout (mobile)
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => const HomePage(),
            '/sale': (context) => const Scaffold(body: Text('Sale Page')),
          },
          initialRoute: '/',
        ),
      );
      await tester.pumpAndSettle();

      // In mobile mode, top row should show the menu icon
      final menuIconFinder = find.byIcon(Icons.menu);
      expect(menuIconFinder, findsOneWidget);

      // Tap menu icon to open drawer
      await tester.tap(menuIconFinder);
      await tester.pumpAndSettle();

      // Drawer options should be visible
      expect(find.text('Home'), findsWidgets); // drawer item
      expect(find.text('Sale'), findsWidgets);
      expect(find.text('About'), findsWidgets);
      expect(find.text('Collections'), findsWidgets);
      expect(find.text('The Print Shack'), findsWidgets);

      // Tap "Sale" in drawer and confirm navigation works
      await tester.tap(find.text('Sale').first);
      await tester.pumpAndSettle();

      expect(find.text('Sale Page'), findsOneWidget);
    });
  });
}
