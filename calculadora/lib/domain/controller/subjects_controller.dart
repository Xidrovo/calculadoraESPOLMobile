import 'package:calculadora/domain/controller/calculator_controller.dart';
import 'package:calculadora/domain/entities/subject_data.dart';
import 'package:calculadora/helpers/storage_helper.dart';
import 'dart:convert';

class SubjectsController implements SubjectData {
  StorageHelper helper = StorageHelper();

  @override
  Future<CalculatorController> getData(String subjectName) async {
    if (subjectName == "") {
      //should return an empty values
      return CalculatorController(100, 0, 0, 0, 0);
    }
    final jsonData = await helper.getData(subjectName);
    Map<String, dynamic> originalData = jsonDecode(jsonData);

    // Casting the dynamic values to double after checking the content.
    Map<String, int> convertedData = originalData.map((key, value) {
      return MapEntry(key, value.toInt());
    });

    return getJsonData(convertedData);
  }

  CalculatorController getJsonData(Map<String, int> json) =>
      CalculatorController(
          json['theoricPorcentage'] as int,
          json['firstPartial'] as int,
          json['secondPartial'] as int,
          json['practicalNote'] as int,
          json['remedial'] as int);

  @override
  Future<Set<String>> getSubjectKeys() async {
    final data = await helper.getAllKeys();
    return data;
  }

  @override
  void saveData(CalculatorController calc, String subjectName) {
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
  Future<void> clearSubject(String subjectName) async {
    final allSubjects = await helper.getAllKeys();
    if (allSubjects.contains(subjectName)) {
      await helper.clearSubject(subjectName);
    }
  }
}
