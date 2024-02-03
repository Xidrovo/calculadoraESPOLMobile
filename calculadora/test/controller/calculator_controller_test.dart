import 'package:calculadora/domain/controller/calculator_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalculatorController', () {
    late CalculatorController calculatorController;

    setUp(() {
      calculatorController = CalculatorController(0, 0, 0, 0, 0);
    });

    test('getPracticalScore returns correct value', () {
      calculatorController.theoricPorcentage = 0;
      calculatorController.practicalNote = 50;
      final result = calculatorController.getPracticalScore();
      expect(result, 50.0);
    });

    test('getHigherNumAvg returns correct value', () {
      calculatorController.firstPartial = 80;
      calculatorController.secondPartial = 60;
      calculatorController.remedial = 80;

      final result = calculatorController.getHigherNumAvg();
      expect(result, 80);
    });

    test('getMinScore returns correct value', () {
      calculatorController.theoricPorcentage = 80;
      calculatorController.firstPartial = 50;
      calculatorController.secondPartial = 60;
      calculatorController.practicalNote = 50;
      final result = calculatorController.getMinScore(54);
      expect(result, 65);
    });

    test('getTotal returns correct value', () {
      calculatorController.theoricPorcentage = 80;
      calculatorController.firstPartial = 79;
      calculatorController.secondPartial = 59;
      calculatorController.practicalNote = 50;
      final result = calculatorController.getTotal();
      expect(result, 65.2);
    });

    test('getTotal returns correct value', () {
      calculatorController.theoricPorcentage = 10;
      calculatorController.firstPartial = 50;
      calculatorController.secondPartial = 60;
      calculatorController.practicalNote = 59;
      calculatorController.remedial = 78;
      final result = calculatorController.getTotal();
      expect(result, 60);
    });
  });
}
