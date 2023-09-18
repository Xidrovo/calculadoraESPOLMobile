import 'package:calculadora/domain/controller/calculator_controller.dart';
import 'package:calculadora/domain/entities/subject_data.dart';
import 'package:calculadora/helpers/storage_helper.dart';
import 'dart:convert';

class SubjectsController implements SubjectData {
  StorageHelper helper = StorageHelper();

  @override
  Future<CalculatorController> getData(String subjectName) async {
    final jsonData = await helper.getData(subjectName);
    return getJsonData(jsonDecode(jsonData));
  }

  CalculatorController getJsonData(Map<String, double> json) =>
      CalculatorController(
          double.parse(json['theoricPorcentage'] as String),
          double.parse(json['firstPartial'] as String),
          double.parse(json['secondPartial'] as String),
          double.parse(json['practicalNote'] as String),
          double.parse(json['remedial'] as String));

  @override
  Future<Set<String>> getSubjectKeys() async {
    final data = await helper.getAllKeys();
    return data;
  }

  @override
  void saveData(CalculatorController calc, String subjectName) {
    // Should take a look if the subjectName already exist
    // What happends if so?
    final castCalculator = {
      'theoricPorcentage': calc.theoricPorcentage,
      'firstPartial': calc.firstPartial,
      'secondPartial': calc.secondPartial,
      'practicalNote': calc.practicalNote,
      'remedial': calc.remedial
    };
    String jsonString = jsonEncode(castCalculator);
    helper.saveSubjectData(subjectName, jsonString);
  }

  @override
  void clearAllSubjects() {
    helper.clear();
  }

  @override
  void clearSubject(String subjectName) async {
    final allSubjects = await helper.getAllKeys();
    if (allSubjects.contains(subjectName)) {
      helper.clearSubject(subjectName);
    }
  }
}
