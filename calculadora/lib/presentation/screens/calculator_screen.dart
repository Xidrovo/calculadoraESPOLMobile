import "package:calculadora/domain/controller/calculator_controller.dart";
import "package:calculadora/domain/entities/label_type_enum.dart";
import "package:calculadora/presentation/widgets/label_input.dart";
import "package:flutter/material.dart";

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

// ignore: camel_case_types
class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorController _calc = CalculatorController(100, 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF004448),
        title: const Text('Calculadora de promedios'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LabelInput(label: "Porcentaje teórico", labelType: labelTypeEnum.theoricPorcentage, calc: _calc),
                const Padding(padding: EdgeInsets.only(bottom: 10.0)),
                LabelInput(label: "Primer parcial sobre 100", labelType: labelTypeEnum.firstPartial, calc: _calc),
                LabelInput(label: "Segundo parcial sobre 100", labelType: labelTypeEnum.secondPartial, calc: _calc),
                LabelInput(label: "Nota práctica", labelType: labelTypeEnum.practicalNote, calc: _calc),
                LabelInput(label: "Mejoramiento", labelType: labelTypeEnum.remedial, calc: _calc),
                OutlinedButton(
                  onPressed: () {
                    _calc.getTotal();
                  },
                  child: const Text('Calcular!'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
