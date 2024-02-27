import 'package:calculadora/presentation/screens/calculator_screen.dart';
import 'package:calculadora/presentation/widgets/button.dart';
import 'package:calculadora/presentation/widgets/label_input.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('CalculatorScreen has a title buttons and creddits',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: CalculatorScreen()));

    // Verify that our CalculatorScreen has a title.
    expect(find.text('Calculadora de promedios'), findsOneWidget);
    expect(find.text('¡Calcular!'), findsOneWidget);
    expect(find.text('Guardar datos'), findsOneWidget);
    expect(
        find.text(
            'Las calificaciones se ingresan sobre 100 y se calcula su promedio de acuerdo al porcentaje práctico/teórico de la materia.\nCreado por: Xavier Idrovo Vallejo y Carlos Carvajal Villegas.'),
        findsOneWidget);
  });

  testWidgets('CalculatorScreen has a Button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: CalculatorScreen()));

    // Verify that our calculator screen has a Button.
    expect(find.byType(Button), findsAtLeastNWidgets(2));
  });

  testWidgets('Calculator Screen has labels', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: CalculatorScreen()));
    final labelInputWidgets =
        tester.widgetList(find.byType(LabelInput)).toList();
    final expectedText = [
      'Porcentaje teórico',
      'Primer parcial sobre 100',
      'Segundo parcial sobre 100',
      'Nota práctica',
      'Mejoramiento'
    ];
    expect(labelInputWidgets.length, 5);
    for (var i = 0; i < labelInputWidgets.length; i++) {
      expect((labelInputWidgets[i] as LabelInput).label, expectedText[i]);
    }
  });

  // testWidgets('Tapping "¡Calcular!" that shows the "reprobado" text',
  //     (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MaterialApp(home: CalculatorScreen()));

  //   // Find the 'guardar datos' button and tap on it.
  //   // final button = find.widgetWithText(ElevatedButton, 'Guardar datos');
  //   final button = find.text('¡Calcular!');
  //   await tester.tap(button);

  //   // Wait for the setState to complete and the widget tree to rebuild.
  //   await tester.pumpAndSettle();

  //   // Wait for the scroll animation to complete.
  //   await tester.pump(const Duration(milliseconds: 350));

  //   // Verify that a Message is shown.
  //   expect(find.byKey(widgetKey), findsOneWidget);
  // });
}
