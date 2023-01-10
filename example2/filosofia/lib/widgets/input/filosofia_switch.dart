import 'package:filosofia/theme/filosofia_theme.dart';
import 'package:flutter/cupertino.dart';


class FilosofiaSwitch extends StatelessWidget {
  final Function(bool) onChanged;
  final bool value;
  final String left;
  final String right;

  const FilosofiaSwitch(
      {Key? key, required this.onChanged, required this.value, required this.left, required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: FilosofiaTheme.of(context).spacing.sm),
          child: Text(
            left,
              style: TextStyle(
                  backgroundColor: FilosofiaTheme.of(context)
                      .theme
                      .materialTheme
                      .backgroundColor,
                  fontSize: 16)
          ),
        ),
        CupertinoSwitch(
            value: value,
            activeColor:
            FilosofiaTheme.of(context).theme.materialTheme.primaryColor,
            onChanged: onChanged),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: FilosofiaTheme.of(context).spacing.sm),
          child: Text(
              right,
              style: TextStyle(
                  backgroundColor: FilosofiaTheme.of(context)
                      .theme
                      .materialTheme
                      .backgroundColor,
                  fontSize: 16)
          ),
        ),
      ],
    );
  }
}
