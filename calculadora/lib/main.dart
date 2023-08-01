import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de promedios',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de promedios'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}