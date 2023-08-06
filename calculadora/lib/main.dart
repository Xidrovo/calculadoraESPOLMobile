import 'package:calculadora/config/theme/app_theme.dart';
import 'package:calculadora/presentation/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de promedios',
      theme: AppTheme().theme(),
      debugShowCheckedModeBanner: false,
      home: const CalculatorScreen(),
    );
  }
}
