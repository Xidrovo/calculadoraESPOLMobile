import "package:calculadora/domain/controller/calculator_controller.dart";
import "package:calculadora/domain/controller/input_dialog_controller.dart";
import "package:calculadora/domain/entities/label_type_enum.dart";
import "package:calculadora/presentation/widgets/button.dart";
import "package:calculadora/presentation/widgets/label_input.dart";
import "package:calculadora/presentation/widgets/message.dart";
import "package:calculadora/presentation/widgets/select.dart";
import "package:flutter/material.dart";

import "../../domain/controller/subjects_controller.dart";

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

// ignore: camel_case_types
class _CalculatorScreenState extends State<CalculatorScreen> {
  final GlobalKey widgetKey = GlobalKey();
  CalculatorController _calc = CalculatorController(100, 0, 0, 0, 0);
  final _scrollController = ScrollController();
  final SubjectsController subjectController = SubjectsController();
  final InputDialogController inputDialogController = InputDialogController();
  late Select select;
  String _subject = "";
  late GradesForm grades = GradesForm(calc: _calc);

  bool _showMessage = false;
  Set<String> _subjects = <String>{};

  double _getWidgetPosition() {
    RenderBox renderBox =
        widgetKey.currentContext?.findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);
    return position.dy;
  }

  void _loadSubjects() async {
    _subjects = await subjectController.getSubjectKeys();
    if (_subjects.isNotEmpty) {
      select = Select(items: _subjects, callback: onChange);
      setState(() {});
    }
  }

  void onChange(String value) async {
    _calc = await subjectController.getData(value);
    setState(() {
      grades = GradesForm(calc: _calc);
      _subject = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

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
              const Padding(padding: EdgeInsets.only(top: 50)),
              _subjects.isNotEmpty ? select : Container(),
              grades,
              const Padding(padding: EdgeInsets.only(top: 25)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    onPressed: () {
                      setState(() {
                        _calc.getTotal();
                      });
                      _showMessage = true;
                      FocusScope.of(context).unfocus();
                      _getWidgetPosition();
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent - 50,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                      );
                    },
                    label: "¡Calcular!",
                  ),
                  Button(
                    onPressed: () async {
                      await inputDialogController.openInputDialog(
                        context,
                        subjectController,
                        _calc,
                        _subject,
                      );
                      _loadSubjects();
                    },
                    label: _subject.isNotEmpty
                        ? "¡Actualizar datos!"
                        : "¡Guardar datos!",
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 25)),
              _showMessage
                  ? Message(
                      key: widgetKey,
                      score: _calc.getTotal(),
                      minimumScore: _calc.getMinScore(_calc.getTotal()))
                  : Container(
                      key: widgetKey,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
              const Credits()
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class GradesForm extends StatefulWidget {
  CalculatorController calc;

  GradesForm({super.key, required this.calc});

  @override
  State<GradesForm> createState() => _GradesFormState();
}

class Credits extends StatelessWidget {
  const Credits({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF004448),
          border: Border.all(width: 0, color: const Color(0xFF004448))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      child: const Text(
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
          "Las calificaciones se ingresan sobre 100 y se calcula su promedio de acuerdo al porcentaje práctico/teórico de la materia.\nCreado por: Xavier Idrovo Vallejo y Carlos Carvajal Villegas."),
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
              calc: widget.calc),
          const Padding(padding: EdgeInsets.only(bottom: 10.0)),
          LabelInput(
              label: "Primer parcial sobre 100",
              labelType: labelTypeEnum.firstPartial,
              calc: widget.calc),
          LabelInput(
              label: "Segundo parcial sobre 100",
              labelType: labelTypeEnum.secondPartial,
              calc: widget.calc),
          LabelInput(
              label: "Nota práctica",
              labelType: labelTypeEnum.practicalNote,
              calc: widget.calc),
          LabelInput(
              label: "Mejoramiento",
              labelType: labelTypeEnum.remedial,
              calc: widget.calc),
        ],
      ),
    );
  }
}
