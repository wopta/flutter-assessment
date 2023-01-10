import 'package:filosofia/widgets/input/Filosofia_outlined_text_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilosofiaDatePickerTextField extends StatelessWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime initialDate;
  final DateTime? pickedDate;
  final DateFormat formatter;
  final void Function(DateTime)? onDateChanged;
  final String label;
  final TextEditingController _textEditingController = TextEditingController();

  FilosofiaDatePickerTextField({
    required this.initialDate,
    required this.lastDate,
    required this.firstDate,
    required this.label,
    this.onDateChanged,
    required this.pickedDate,
    DateFormat? dateFormat,
    Key? key,
  })  : formatter = dateFormat ?? DateFormat('dd/MM/yyyy'),
        super(key: key);

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    if (pickedDate != null) {
      _textEditingController.text = formatter.format(pickedDate!);
    }
    return FilosofiaTextFormField(
      enabled: onDateChanged != null,
      labelText: label,
      height: 1,
      filled: false,
      controller: _textEditingController,
      onTap: onDateChanged != null
          ? () async {
              // Below line stops keyboard from appearing
              FocusScope.of(context).requestFocus(new FocusNode());
              // Show Date Picker Here
              final datePicked = await _selectDate(context);
              if (datePicked == null) return;
              onDateChanged!(datePicked);
            }
          : null,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Event Date is Required.';
        }
        return null;
      },
      suffix: const Icon(Icons.calendar_today_rounded),
    );
  }
}
