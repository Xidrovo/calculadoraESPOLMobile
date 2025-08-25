import 'package:calculadora/domain/entities/label_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/controller/calculator_controller.dart';

// ignore: must_be_immutable
class LabelInput extends StatefulWidget {
  final String label;
  CalculatorController calc;
  final labelTypeEnum labelType;

  LabelInput({
    super.key,
    required this.label,
    required this.calc,
    required this.labelType,
  });

  void onChangeHandle(value) {
    int? parsedValue = parseValue(double.tryParse(value ?? ''));
    switch (labelType) {
      case labelTypeEnum.theoricPorcentage:
        calc.theoricPorcentage = parsedValue ?? 0;
        break;
      case labelTypeEnum.firstPartial:
        calc.firstPartial = parsedValue ?? 0;
        break;
      case labelTypeEnum.secondPartial:
        calc.secondPartial = parsedValue ?? 0;
        break;
      case labelTypeEnum.practicalNote:
        calc.practicalNote = parsedValue ?? 0;
        break;
      case labelTypeEnum.remedial:
        calc.remedial = parsedValue ?? 0;
        break;
      }
  }

  int getsScoreValue() {
    switch (labelType) {
      case labelTypeEnum.theoricPorcentage:
        return calc.theoricPorcentage;
      case labelTypeEnum.firstPartial:
        return calc.firstPartial;
      case labelTypeEnum.secondPartial:
        return calc.secondPartial;
      case labelTypeEnum.practicalNote:
        return calc.practicalNote;
      case labelTypeEnum.remedial:
        return calc.remedial;
      }
  }

  int? parseValue(double? value) {
    if (value == null) {
      return null;
    }
    if (value > 100) {
      return 100;
    }
    if (value < 0) {
      return 0;
    }
    return value.toInt();
  }

  String? maxMinLimitValidator(value) {
    double? doubleValue = double.tryParse(value ?? '');
    if (doubleValue == null) {
      return 'Debe agregar un valor';
    }
    if (doubleValue > 100) {
      return 'El Número no puede exceder de 100';
    }
    if (doubleValue < 0) {
      return 'El Número no puede ser menor a 0';
    }
    return null;
  }

  @override
  State<LabelInput> createState() => _LabelInputState();
}

class _LabelInputState extends State<LabelInput> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = widget.getsScoreValue().toString();
  }

  @override
  void didUpdateWidget(LabelInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.getsScoreValue() != oldWidget.getsScoreValue()) {
      _controller.text = widget.getsScoreValue().toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 2.5, top: 5)),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              controller: _controller,
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
                  borderSide: BorderSide.none,
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
