import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilosofiaSafeArea extends StatelessWidget {
  final Widget child;
  final Color color;

  const FilosofiaSafeArea({Key? key, required this.child, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDarkMode
          ? SystemUiOverlayStyle.dark.copyWith(statusBarColor: color)
          : SystemUiOverlayStyle.light.copyWith(statusBarColor: color),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
