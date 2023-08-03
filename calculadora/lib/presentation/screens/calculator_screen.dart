import "package:calculadora/domain/controller/calculator_controller.dart";
import "package:calculadora/presentation/widgets/label_input.dart";
import "package:flutter/cupertino.dart";

// ignore: camel_case_types
class calculatorScreen extends StatefulWidget {
  const calculatorScreen({super.key});

  @override
  State<calculatorScreen> createState() => _calculatorScreenState();
}

// ignore: camel_case_types
class _calculatorScreenState extends State<calculatorScreen> {
  CalculatorController calc = CalculatorController(100, 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal : 16.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 50),
            child: labelInput(label: "Porcentaje teórico"),
          ),
          labelInput(label: "Primer parcial sobre 100"),
          labelInput(label: "Segundo parcial sobre 100"),
          labelInput(label: "Nota práctica"),
          labelInput(label: "Mejoramiento"),
        ],
      ),
    );
  }
}