import 'dart:math';

import 'package:calculadora/domain/entities/calculator.dart';

class CalculatorController implements Calculator {
  double _theoricPorcentage = 0;
  double _firstPartial = 0;
  double _secondPartial = 0;
  double _practicalNote = 0;
  double _remedial = 0;

  CalculatorController(this._theoricPorcentage, this._firstPartial,
      this._secondPartial, this._practicalNote, this._remedial) {
    // assert(_theoricPorcentage >= 0 && _theoricPorcentage <= 100,
    //     'Theoretical percentage must be between 0 and 100');
    // assert(_firstPartial >= 0 && _firstPartial <= 100,
    //     'firstPartial must be between 0 and 100');
    // assert(_secondPartial >= 0 && _secondPartial <= 100,
    //     'secondPartial must be between 0 and 100');
    // assert(_practicalNote >= 0 && _practicalNote <= 100,
    //     'practicalNote must be between 0 and 100');
    // assert(_remedial >= 0 && _remedial <= 100,
    //     'remedial must be between 0 and 100');
  }

  double get theoricPorcentage => _theoricPorcentage;
  double get firstPartial => _firstPartial;
  double get secondPartial => _secondPartial;
  double get practicalNote => _practicalNote;
  double get remedial => _remedial;

  set theoricPorcentage(double value) {
    // assert(value >= 0 && value <= 100,
    //     'Theoretical percentage must be between 0 and 100');
    _theoricPorcentage = value;
  }

  set firstPartial(double value) {
    // assert(
    //     value >= 0 && value <= 100, 'firstPartial must be between 0 and 100');
    _firstPartial = value;
  }

  set secondPartial(double value) {
    // assert(
    //     value >= 0 && value <= 100, 'secondPartial must be between 0 and 100');
    _secondPartial = value;
  }

  set practicalNote(double value) {
    // assert(
    //     value >= 0 && value <= 100, 'practicalNote must be between 0 and 100');
    _practicalNote = value;
  }

  set remedial(double value) {
    // assert(value >= 0 && value <= 100, 'remedial must be between 0 and 100');
    _remedial = value;
  }

  double getHigherNumAvg() {
    final double toSubstract =
        min(_firstPartial, min(_secondPartial, _remedial));
    final double total =
        _firstPartial + _secondPartial + _remedial - toSubstract;

    return total / 2;
  }

  double getPracticalScore() =>
      _practicalNote * ((100 - _theoricPorcentage) / 100);

  @override
  double getMinScore(value) {
    final double practicalScore = getPracticalScore();
    if (value < 60) {
      final double maxValue = max(_firstPartial, _secondPartial);
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
