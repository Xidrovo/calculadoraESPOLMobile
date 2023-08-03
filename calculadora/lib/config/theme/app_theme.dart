import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(0, 2, 2, 77);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue
];

class AppTheme {
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[0]
    );
  }
}