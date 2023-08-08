import "package:calculadora/domain/controller/calculator_controller.dart";
import "package:calculadora/domain/entities/label_type_enum.dart";
import "package:calculadora/presentation/widgets/label_input.dart";
import "package:calculadora/presentation/widgets/message.dart";
import "package:flutter/material.dart";

import "../widgets/button.dart";

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

// ignore: camel_case_types
class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorController _calc = CalculatorController(100, 0, 0, 0, 0);
  double _totalValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF004448),
        title: const Text('Calculadora de promedios'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GradesForm(calc: _calc),
              Message(score: _calc.getTotal(), minimunScore: _calc.getMinScore(_calc.getTotal()))
            ],
          ),
        ),
      ),
    );
  }
}

class GradesForm extends StatefulWidget {
  const GradesForm({
    super.key,
    required CalculatorController calc,
  }) : _calc = calc;

  final CalculatorController _calc;

  @override
  State<GradesForm> createState() => _GradesFormState();
}

class _GradesFormState extends State<GradesForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          LabelInput(label: "Porcentaje teórico", labelType: labelTypeEnum.theoricPorcentage, calc: widget._calc),
          const Padding(padding: EdgeInsets.only(bottom: 10.0)),
          LabelInput(label: "Primer parcial sobre 100", labelType: labelTypeEnum.firstPartial, calc: widget._calc),
          LabelInput(label: "Segundo parcial sobre 100", labelType: labelTypeEnum.secondPartial, calc: widget._calc),
          LabelInput(label: "Nota práctica", labelType: labelTypeEnum.practicalNote, calc: widget._calc),
          LabelInput(label: "Mejoramiento", labelType: labelTypeEnum.remedial, calc: widget._calc),
          Button(onPressed: () => widget._calc.getTotal(), label: "¡Calcular!"),
        ],
      ),
    );
  }
}
