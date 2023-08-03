import 'package:flutter/material.dart';

const Color _primary = Color.fromARGB(0, 2, 2, 77);
const Color _secondary = Color.fromARGB(0, 2, 2, 77);
const Color _background = Color(0xFFE5E5E5);

const List<Color> colorThemes = [
  _primary,
  _secondary,
  _background,
  Colors.white
];

class AppTheme {
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorThemes[0],
      scaffoldBackgroundColor: colorThemes[2],
      textTheme:
        TextTheme(
          titleLarge: TextStyle(color: colorThemes[3]),
        ),
    );
  }
}