import 'dart:math';

import 'package:calculadora/domain/entities/calculator.dart';

class CalculatorController implements Calculator {
  int _theoricPorcentage = 0;
  int _firstPartial = 0;
  int _secondPartial = 0;
  int _practicalNote = 0;
  int _remedial = 0;

  CalculatorController(this._theoricPorcentage, this._firstPartial,
      this._secondPartial, this._practicalNote, this._remedial) {}

  int get theoricPorcentage => _theoricPorcentage;
  int get firstPartial => _firstPartial;
  int get secondPartial => _secondPartial;
  int get practicalNote => _practicalNote;
  int get remedial => _remedial;

  set theoricPorcentage(int value) {
    _theoricPorcentage = mapValue(value);
  }

  set firstPartial(int value) {
    _firstPartial = mapValue(value);
  }

  set secondPartial(int value) {
    _secondPartial = mapValue(value);
  }

  set practicalNote(int value) {
    _practicalNote = mapValue(value);
  }

  set remedial(int value) {
    _remedial = mapValue(value);
  }

  int mapValue(int value) {
    if (value < 0) {
      return 0;
    } else if (value > 100) {
      return 100;
    } else {
      return value;
    }
  }

  double getHigherNumAvg() {
    final int toSubstract = min(_firstPartial, min(_secondPartial, _remedial));
    final int total = _firstPartial + _secondPartial + _remedial - toSubstract;

    return total / 2;
  }

  double getPracticalScore() =>
      _practicalNote * ((100 - _theoricPorcentage) / 100);

  @override
  double getMinScore(value) {
    final double practicalScore = getPracticalScore();
    if (value < 60) {
      final int maxValue = max(_firstPartial, _secondPartial);
      final double result =
          ((60 - practicalScore) * 2) / (_theoricPorcentage / 100) - maxValue;
      if (result.isFinite) {
        return result.abs().roundToDouble();
      }
    }
    return -1;
  }

  @override
  double getTotal() {
    final double theoricScore = getHigherNumAvg() * (_theoricPorcentage / 100);
    final double practicalScore = getPracticalScore();

    final double result = theoricScore + practicalScore;
    final double score = double.parse((result).toStringAsFixed(2));
    return score;
  }
}
