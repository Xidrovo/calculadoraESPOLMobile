import "package:calculadora/domain/controller/calculator_controller.dart";
import "package:calculadora/presentation/widgets/label_input.dart";
import "package:flutter/material.dart";

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

// ignore: camel_case_types
class _CalculatorScreenState extends State<CalculatorScreen> {
  CalculatorController calc = CalculatorController(100, 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF004448),
        title: const Text('Calculadora de promedios'),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LabelInput(label: "Porcentaje teórico"),
                LabelInput(label: "Primer parcial sobre 100"),
                LabelInput(label: "Segundo parcial sobre 100"),
                LabelInput(label: "Nota práctica"),
                LabelInput(label: "Mejoramiento"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
