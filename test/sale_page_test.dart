import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Dummy sale page builds', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Sale')),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('Sale'), findsOneWidget);
  });
}
