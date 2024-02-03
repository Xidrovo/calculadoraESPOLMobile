import 'package:calculadora/presentation/screens/calculator_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('CalculatorScreen has a title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: CalculatorScreen()));

    // Verify that our CalculatorScreen has a title.
    expect(find.text('Calculadora de promedios'), findsOneWidget);
  });
}
