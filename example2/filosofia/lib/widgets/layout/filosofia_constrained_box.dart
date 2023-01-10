import 'package:flutter/material.dart';

class FilosofiaConstrainedBox extends StatelessWidget {
  final Widget child;
  final BoxConstraints constraints;

  const FilosofiaConstrainedBox(
      {required this.child,
      this.constraints = const BoxConstraints(minWidth: 100, maxWidth: 600),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: constraints,
        child: child,
      ),
    );
  }
}
