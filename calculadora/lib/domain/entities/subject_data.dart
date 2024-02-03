import 'package:calculadora/domain/controller/calculator_controller.dart';

// ignore: camel_case_types
abstract class SubjectData {
  Future<Set<String>> getSubjectKeys();
  Future<CalculatorController> getData(String subjectName);
  void saveData(CalculatorController calc, String subjectName);
  void clearSubject(String subjectName);
  void clearAllSubjects();
}
