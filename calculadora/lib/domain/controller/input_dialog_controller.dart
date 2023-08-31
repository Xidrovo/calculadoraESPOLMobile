import 'package:flutter/material.dart';

import '../../presentation/widgets/button.dart';

// ignore: camel_case_types
class InputDialogController {
  late String _subjectName;

  Future openInputDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Nombre de la materia'),
            content: TextField(
                onChanged: (value) => _subjectName = value,
                decoration: const InputDecoration(hintText: 'Materia')),
            actions: [
              Button(
                onPressed: () {
                  print('SubjectKey = ${_subjectName ?? ':D'}');
                  Navigator.of(context).pop();
                },
                label: 'Guardar',
              )
            ],
          ));
}
