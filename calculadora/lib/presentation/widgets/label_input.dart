import 'package:flutter/material.dart';

class LabelInput extends StatefulWidget {
  final String label;
  final Function? onChange;

  const LabelInput({
    super.key,
    required this.label,
    this.onChange,
  });

  @override
  State<LabelInput> createState() => _LabelInputState();
}

class _LabelInputState extends State<LabelInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alineación del texto a la izquierda
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: "ej: 80",
            ),
          ),
        ],
      ),
    );
  }
}
