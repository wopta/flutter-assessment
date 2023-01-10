import 'package:filosofia/filosofia.dart';
import 'package:filosofia/theme/filosofia_theme.dart';
import 'package:flutter/material.dart';

import '../buttons/filosofia_link_text.dart';

class FilosofiaDialog extends StatelessWidget {
  final Widget leadingIcon;
  final String title;
  final String? body;
  final FilosofiaLinkText? linkText;
  final FilosofiaDialogTheme? theme;

  const FilosofiaDialog(
      {required this.leadingIcon,
      required this.title,
      this.body,
      this.linkText,
      this.theme,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dialogTheme =
        theme ?? FilosofiaTheme.of(context).theme.dialogPrimaryTheme;
    return GestureDetector(
      onTap: linkText?.onClick,
      child: Card(
        color: dialogTheme.background,
        child: Padding(
          padding: EdgeInsets.all(
            FilosofiaTheme.of(context).spacing.lg,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: FilosofiaTheme.of(context).spacing.lg),
                child: leadingIcon,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: dialogTheme.titleTextStyle,
                    ),
                    if (body != null)
                      Padding(
                        padding: EdgeInsets.only(
                          top: FilosofiaTheme.of(context).spacing.md,
                        ),
                        child: Text(
                          body!,
                          style: dialogTheme.bodyTextStyle,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    if (linkText != null)
                      Padding(
                        padding: EdgeInsets.only(
                          top: FilosofiaTheme.of(context).spacing.md,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: linkText!,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
