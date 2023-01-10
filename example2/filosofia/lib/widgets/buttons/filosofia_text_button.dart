import 'package:filosofia/filosofia.dart';
import 'package:filosofia/widgets/buttons/filosofia_button_style.dart';
import 'package:flutter/material.dart';

class FilosofiaTextButton extends StatelessWidget {
  final FilosofiaButtonStyle buttonStyle;
  final Widget? leading;
  final String text;
  final void Function() onPressed;
  final double _borderRadius = 8;

  const FilosofiaTextButton(
      {required this.onPressed,
      required this.text,
      this.buttonStyle = FilosofiaButtonStyle.primary,
      this.leading,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(FilosofiaTheme.of(context).spacing.md),
      child: Container(
        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: WoptaColors.gradientDark.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonStyle ==
                    FilosofiaButtonStyle.primary
                ? FilosofiaTheme.of(context).theme.materialTheme.primaryColor
                : Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(0.0),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    FilosofiaTheme.of(context).theme.materialTheme.primaryColor,
                width: 2.0,
              ),
              gradient: buttonStyle == FilosofiaButtonStyle.primary
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        WoptaColors.gradientLight,
                        WoptaColors.gradientDark,
                      ],
                      tileMode: TileMode.mirror,
                    )
                  : null,
              borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
            ),
            child: Container(
              constraints:
                  const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
              // min sizes for Material buttons
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(FilosofiaTheme.of(context).spacing.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (leading != null)
                      Padding(
                        padding: EdgeInsets.only(
                          right: FilosofiaTheme.of(context).spacing.md,
                        ),
                        child: leading!,
                      ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          text.toUpperCase(),
                          style: buttonStyle == FilosofiaButtonStyle.primary
                              ? FilosofiaTheme.of(context)
                                  .textTheme
                                  .buttonTextTheme
                              : FilosofiaTheme.of(context)
                                  .textTheme
                                  .buttonSecondaryTextTheme,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
