import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';

class FilosofiaRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String tag;
  final void Function(T?)? onChanged;

  const FilosofiaRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.tag,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<T>(
          value: value,
          fillColor:
              MaterialStateColor.resolveWith((states) => Colors.pinkAccent),
          focusColor: MaterialStateColor.resolveWith((states) => Colors.pink),
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          tag,
          style: FilosofiaTheme.of(context)
              .textTheme
              .filosofiaRadioButtonTextStyle,
        ),
      ],
    );
  }
}
