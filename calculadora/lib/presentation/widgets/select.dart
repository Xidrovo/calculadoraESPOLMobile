import 'package:flutter/material.dart';

typedef StringToVoidFunc = void Function(String);

// ignore: camel_case_types, must_be_immutable
class Select extends StatefulWidget {
  late Set<String> items;
  final StringToVoidFunc callback;

  Select({super.key, required this.items, required this.callback});

  hasItems() {
    return items.isNotEmpty;
  }

  @override
  State<Select> createState() => _selectState();
}

// ignore: camel_case_types
class _selectState extends State<Select> {
  String? dropdownValue;
  late Set<String> _items;

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      _items = widget.items;
    }

    return DropdownButton<String>(
      hint: const Text("Elige la materia"),
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onTap: () => setState(() {}),
      onChanged: (String? value) {
        widget.callback(value!);
        setState(() {
          dropdownValue = value;
        });
      },
      items: _items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
