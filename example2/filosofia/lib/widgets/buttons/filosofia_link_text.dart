import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';

import '../../theme/filosofia_theme.dart';

class FilosofiaLinkText extends StatelessWidget {
  final void Function() onClick;
  final String text;
  final FilosofiaLinkTextTheme? theme;

  const FilosofiaLinkText(
      {required this.onClick, required this.text, this.theme, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final linkTextTheme =
        theme ?? FilosofiaTheme.of(context).theme.linkTextPrimaryTheme;
    return GestureDetector(
      onTap: onClick,
      child: Row(
        children: [
          Text(
            text,
            style: linkTextTheme.textStyle,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: FilosofiaTheme.of(context).spacing.md,
            ),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: linkTextTheme.iconStyle.color,
              size: linkTextTheme.iconStyle.size,
            ),
          )
        ],
      ),
    );
  }
}
