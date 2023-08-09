import 'package:calculadora/domain/entities/label_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/controller/calculator_controller.dart';

class LabelInput extends StatefulWidget {
  final String label;
  final CalculatorController calc;
  final labelTypeEnum labelType;

  const LabelInput({
    super.key,
    required this.label,
    required this.calc,
    required this.labelType,
  });

  void onChangeHandle(value) {
    double? doubleValue = double.tryParse(value ?? '');
    switch (labelType) {
      case labelTypeEnum.theoricPorcentage:
        calc.theoricPorcentage = doubleValue ?? 0;
        break;
      case labelTypeEnum.firstPartial:
        calc.firstPartial = doubleValue ?? 0;
        break;
      case labelTypeEnum.secondPartial:
        calc.secondPartial = doubleValue ?? 0;
        break;
      case labelTypeEnum.practicalNote:
        calc.practicalNote = doubleValue ?? 0;
        break;
      case labelTypeEnum.remedial:
        calc.remedial = doubleValue ?? 0;
        break;
      default:
    }
  }

  String? maxMinLimitValidator(value) {
    int? intValue = int.tryParse(value ?? '');
    if (intValue == null) {
      return 'Debe agregar un valor';
    }
    if (intValue > 100) {
      return 'El Número no puede exceder de 100';
    }
    if (intValue < 0) {
      return 'El Número no puede ser menor a 0';
    }
    return null;
  }

  @override
  State<LabelInput> createState() => _LabelInputState();
}

class _LabelInputState extends State<LabelInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alineación del texto a la izquierda
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              onChanged: (value) => widget.onChangeHandle(value),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) => widget.maxMinLimitValidator(value),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "ej: 80",
              ),
            ),
          )
        ],
      ),
    );
  }
}
