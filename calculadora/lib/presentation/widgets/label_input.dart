import 'package:flutter/material.dart';

// ignore: camel_case_types
class labelInput extends StatefulWidget {
  final String label;
  final Function? onChange;
  
  const labelInput({
    super.key,
    required this.label,
    this.onChange,
    });

  @override
  State<labelInput> createState() => _labelInputState();
}

// ignore: camel_case_types
class _labelInputState extends State<labelInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(widget.label),
        TextFormField(      
          decoration: const InputDecoration(
            filled: true
          ),
        ),
      ],
    );
  }
}