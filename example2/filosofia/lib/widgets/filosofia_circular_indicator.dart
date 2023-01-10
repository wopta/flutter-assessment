import 'dart:math';

import 'package:flutter/material.dart';

class FilosofiaCircularIndicator extends StatefulWidget {
  const FilosofiaCircularIndicator({Key? key}) : super(key: key);

  @override
  State<FilosofiaCircularIndicator> createState() =>
      _FilosofiaCircularIndicatorState();
}

class _FilosofiaCircularIndicatorState extends State<FilosofiaCircularIndicator>
    with TickerProviderStateMixin {
  late Animation<double> rotationAnimation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..addListener(() {
        setState(() {});
      });

    rotationAnimation =
        Tween<double>(begin: 0.0, end: 2.0 * pi).animate(controller);
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Transform.rotate(
          angle: rotationAnimation.value,
          child: Image.asset(
            "assets/icons/round-logo02.png",
            height: 48,
          ),
        ),
      ),
    );
  }
}
