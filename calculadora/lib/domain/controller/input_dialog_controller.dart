import 'package:calculadora/domain/controller/calculator_controller.dart';
import 'package:calculadora/domain/controller/subjects_controller.dart';
import 'package:flutter/material.dart';

import '../../presentation/widgets/button.dart';

class InputDialogController {
  late String _subjectName;

  Future openInputDialog(
    BuildContext context,
    SubjectsController subjectController,
    CalculatorController calc,
    String subjectName,
  ) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Nombre de la materia'),
          content: TextField(
            onChanged: (value) => _subjectName = value,
            decoration: InputDecoration(
              hintText: subjectName.isEmpty ? "Materia" : subjectName,
            ),
          ),
          actions: [
            Button(
              onPressed: () {
                subjectController.saveData(calc, _subjectName);
                Navigator.of(context).pop();
              },
              label: 'Guardar',
            )
          ],
        ),
      );
}
