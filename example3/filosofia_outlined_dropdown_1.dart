import 'package:flutter/material.dart';

class FilosofiaDropDown extends StatelessWidget {
  List<String> items;
  String? selectedVal = '';
  late String hint;
  final String? Function(String?)? validator;
  Function? onChanged;

  FilosofiaDropDown(
      {super.key, required this.items, this.selectedVal, required this.hint, this.validator, this.onChanged });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items.map((e) {
        return DropdownMenuItem(value: e, child: Text(e));
      }).toList(),
      onChanged: (val) {
        selectedVal = val as String;
        onChanged?.call();
      },
      validator: validator,
      hint: Text(hint),
      value: selectedVal,
      decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 16.0),
          hintStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
