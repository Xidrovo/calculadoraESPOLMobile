import 'package:calculadora/domain/controller/calculator_controller.dart';
import 'package:calculadora/domain/controller/subjects_controller.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class InputDialogController {
  String _subjectName = '';

  Future openInputDialog(
      BuildContext context,
      SubjectsController subjectController,
      CalculatorController calc,
      String currentSubject) {
    if (currentSubject.isNotEmpty) {
      _subjectName = currentSubject;
    }
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Nombre de la materia'),
              content: TextField(
                  onChanged: (value) {
                    _subjectName = value;
                  },
                  decoration: InputDecoration(
                      hintText: (currentSubject.isNotEmpty)
                          ? currentSubject
                          : 'Materia')),
              actions: [
                TextButton(
                  onPressed: () {
                    if (_subjectName.isNotEmpty || currentSubject.isNotEmpty) {
                      subjectController.saveData(
                          calc,
                          _subjectName.isNotEmpty
                              ? _subjectName
                              : currentSubject);
                      _subjectName = '';
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ));
  }
}
