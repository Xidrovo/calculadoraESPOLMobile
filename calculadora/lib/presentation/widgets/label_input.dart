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
      children: [
        Text(widget.label, textAlign: TextAlign.left),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: "ej: 80"
          ),
        ),
      ],
    );
  }
}