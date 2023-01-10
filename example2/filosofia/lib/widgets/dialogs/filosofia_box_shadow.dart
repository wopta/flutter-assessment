import 'package:filosofia/colors/wopta_colors.dart';
import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';

class FilosofiaBoxShadow extends StatelessWidget {
  final Widget child;
  final void Function()? onClick;

  const FilosofiaBoxShadow({
    Key? key,
    required this.child,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: WoptaColors.shadowIce,
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(2, 4),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
        ),
        child: child,
      ),
    );
  }
}
