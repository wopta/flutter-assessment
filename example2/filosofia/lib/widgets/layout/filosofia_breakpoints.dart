import 'package:flutter/material.dart';

class FilosofiaBreakpoints {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= mobileBreakpointWidth;
  }

  static bool isTablet(BuildContext context) {
    return !isMobile(context) &&
        MediaQuery.of(context).size.width <= tabletBreakpointWidth;
  }

  static bool isDesktop(BuildContext context) {
    return !isMobile(context) && !isTablet(context);
  }

  static const mobileBreakpointWidth = 600;
  static const tabletBreakpointWidth = 800;
}
