import 'package:calculadora/config/theme/app_theme.dart';
import 'package:calculadora/presentation/widgets/label_input.dart';
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de promedios'),
        ),
        body: const Column(
          children: [
            labelInput(label: 'Some Text')
          ],
        ),
      ),
    );
  }
}