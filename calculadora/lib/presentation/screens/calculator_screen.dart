import "package:calculadora/domain/controller/calculator_controller.dart";
import "package:calculadora/domain/entities/label_type_enum.dart";
import "package:calculadora/presentation/widgets/button.dart";
import "package:calculadora/presentation/widgets/label_input.dart";
import "package:calculadora/presentation/widgets/message.dart";
import "package:flutter/material.dart";

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

// ignore: camel_case_types
class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorController _calc = CalculatorController(100, 0, 0, 0, 0);
  final _scrollController = ScrollController();
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 1.0,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF004448),
        title: const Text('Calculadora de promedios'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              GradesForm(calc: _calc),
              Button(
                  onPressed: () {
                        setState(() {
                          _calc.getTotal();
                        });
                        FocusScope.of(context).unfocus();
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent - 50,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeInOut,
                        );
                      },
                  label: "¡Calcular!"),
              Message(
                  score: _calc.getTotal(),
                  minimunScore: _calc.getMinScore(_calc.getTotal())),
              const credits()
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
// ignore: camel_case_types
class credits extends StatelessWidget {
  const credits({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFF004448)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const Column(
            children: [
            Text(
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
              "Las calificaciones se ingresan sobre 100 y se calcula su promedio de acuerdo al porcentaje práctico/teórico de la materia."),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Text(
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
              "Creado por: Xavier Idrovo Vallejo y Carlos Carvajal Villegas."),
          ],),
    );
  }
}

class _GradesFormState extends State<GradesForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          LabelInput(
              label: "Porcentaje teórico",
              labelType: labelTypeEnum.theoricPorcentage,
              calc: widget._calc),
          const Padding(padding: EdgeInsets.only(bottom: 10.0)),
          LabelInput(
              label: "Primer parcial sobre 100",
              labelType: labelTypeEnum.firstPartial,
              calc: widget._calc),
          LabelInput(
              label: "Segundo parcial sobre 100",
              labelType: labelTypeEnum.secondPartial,
              calc: widget._calc),
          LabelInput(
              label: "Nota práctica",
              labelType: labelTypeEnum.practicalNote,
              calc: widget._calc),
          LabelInput(
              label: "Mejoramiento",
              labelType: labelTypeEnum.remedial,
              calc: widget._calc),
        ],
      ),
    );
  }
}
