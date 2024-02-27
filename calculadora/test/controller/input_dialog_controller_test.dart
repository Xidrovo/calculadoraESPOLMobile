import 'package:calculadora/domain/controller/calculator_controller.dart';
import 'package:calculadora/domain/controller/input_dialog_controller.dart';
import 'package:calculadora/domain/controller/subjects_controller.dart';
import 'package:calculadora/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('InputDialogController opens dialog and saves data',
      (WidgetTester tester) async {
    // Create a MaterialApp to provide context for showDialog
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  InputDialogController().openInputDialog(
                      context,
                      SubjectsController(), // Mock or dummy implementation
                      CalculatorController(0, 0, 0, 0, 0),
                      '');
                },
                child: const Text('Open Dialog'),
              ),
            );
          },
        ),
      ),
    ));

    // Simulate tapping the button to open the dialog
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Wait for the dialog to open

    // Simulate user input
    await tester.enterText(find.byType(TextField), 'Test Subject');

    // Simulate tapping the "Guardar" button
    await tester.tap(find.widgetWithText(Button, 'Guardar'));
    await tester.pumpAndSettle(); // Wait for any animations to complete
  });
}
