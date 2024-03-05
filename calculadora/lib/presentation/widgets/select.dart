import 'package:flutter/material.dart';

import '../../domain/controller/subjects_controller.dart';

typedef StringToVoidFunc = void Function(String);

// ignore: camel_case_types, must_be_immutable
class Select extends StatefulWidget {
  late Set<String> items;
  final StringToVoidFunc callback;
  final SubjectsController subjectController = SubjectsController();

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

    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
          width: 0,
        ),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text("Elige la materia"),
        ),
        value: dropdownValue,
        icon: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 15.0), // adjust the padding as needed
          child: Icon(Icons.arrow_downward),
        ),
        elevation: 16,
        underline: Container(
          height: 0,
          color: Colors.deepPurpleAccent,
        ),
        onTap: () => setState(() {}),
        onChanged: (String? value) {
          if (value == null) {
            widget.callback("");
            setState(() {
              dropdownValue = null;
            });
          } else {
            widget.callback(value);
            setState(() {
              dropdownValue = value;
            });
          }
        },
        items: [
          const DropdownMenuItem<String>(
            value: null,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Elige la materia"),
            ),
          ),
          ..._items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ), // adjust the padding as needed
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value),
                    IconButton(
                        icon: const Icon(Icons.delete,
                            color: Colors.red, size: 20.0),
                        onPressed: () => deleteDialog(context, value))
                  ],
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }

  Future<dynamic> deleteDialog(BuildContext context, String value) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Borrar materia?'),
          content: Text('Estás seguro que quieres eliminar $value'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Borrar'),
              onPressed: () async {
                // handle delete action
                await widget.subjectController.clearSubject(value);
                setState(() {
                  _items = Set<String>.from(_items)..remove(value);
                  dropdownValue = null;
                });
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
