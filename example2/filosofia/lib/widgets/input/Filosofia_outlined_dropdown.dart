import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';

class FilosofiaDropDown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final String hint;
  final void Function(T?) onChanged;
  final String Function(T)? valueMapperToString;
  final String? Function(T?)? validator;

  const FilosofiaDropDown({
    super.key,
    required this.items,
    this.value,
    required this.hint,
    required this.onChanged,
    this.valueMapperToString,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item is String ? item : valueMapperToString!(item)),
        );
      }).toList(),
      onChanged: onChanged,
      value: value,
      validator: validator,
      selectedItemBuilder: (context) => items
          .map((value) => FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  value is String ? value : valueMapperToString!(value),
                ),
              ))
          .toList(),
      hint: Text(
        hint,
        overflow: TextOverflow.ellipsis,
      ),
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: FilosofiaTheme.of(context).theme.materialTheme.primaryColor,
            width: 10.0,
          ),
        ),
        labelText: value == null ? null : hint,
      ),
    );
  }
}
