import 'package:flutter/material.dart';

import '../colors/wopta_colors.dart';

class FilosofiaTextTheme {
  final cardTitleLg = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: WoptaColors.primary,
    fontFamily: 'Montserrat',
  );
  final cardTitleMd = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: WoptaColors.primary,
    fontFamily: 'Montserrat',
  );
  final cardTitleSmMd = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: WoptaColors.primary,
    fontFamily: 'Montserrat',
  );
  final cardTitleSm = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: WoptaColors.primary,
    fontFamily: 'Montserrat',
  );
  final cardTitleXs = const TextStyle(
    fontSize: 8.0,
    fontWeight: FontWeight.bold,
    color: WoptaColors.primary,
    fontFamily: 'Montserrat',
  );

  final cardSubtitleLg = const TextStyle(
    fontSize: 24.0,
    fontStyle: FontStyle.italic,
    color: Colors.black,
    fontFamily: 'Montserrat',
  );
  final cardSubtitleMd = const TextStyle(
    fontSize: 18.0,
    fontStyle: FontStyle.italic,
    color: Colors.black,
    fontFamily: 'Montserrat',
  );
  final cardSubtitleSmMd = const TextStyle(
    fontSize: 16.0,
    fontStyle: FontStyle.italic,
    color: Colors.black,
    fontFamily: 'Montserrat',
  );
  final cardSubtitleSm = const TextStyle(
    fontSize: 12.0,
    fontStyle: FontStyle.italic,
    color: Colors.black,
    fontFamily: 'Montserrat',
  );
  final cardSubtitleXs = const TextStyle(
    fontSize: 8.0,
    fontStyle: FontStyle.italic,
    color: Colors.black,
    fontFamily: 'Montserrat',
  );

  final appBarTitle = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  final subtitleMd = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w300,
    color: Colors.black87,
  );

  final subtitleSm = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w300,
    color: Colors.black87,
  );

  final hyperLinkMd = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w300,
    color: Colors.blue,
  );

  final filosofiaRadioButtonTextStyle = const TextStyle(fontSize: 16.0);

  final versioningAppTextStyle = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.black45,
    letterSpacing: 2.5,
  );

  final bottomNavPageTitle = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  final bottomNavPageTitleSelected = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: WoptaColors.primary,
  );

  final buttonTextTheme = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 2.5,
  );

  final linkTextTheme = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  final buttonSecondaryTextTheme = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: WoptaColors.primary,
    letterSpacing: 2.5,
  );

  final textDividerTextTheme = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.black54,
    letterSpacing: 2.5,
  );

  final lightButtonTextTheme = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
    letterSpacing: 1.5,
  );

  final dialogTitleTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 1,
  );

  final dialogBodyTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 1,
  );

  final sectionTitleMd = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

class FilosofiaSpacing {
  final xs = 4.0;
  final sm = 8.0;
  final sm_md = 10.0;
  final md = 12.0;
  final md_lg = 18.0;
  final lg = 24.0;
  final xl = 28.0;
  final xxl = 32.0;
}

class FilosofiaThemeData {
  ThemeData get materialTheme {
    return ThemeData(
        primaryColor: WoptaColors.primary,
        primaryColorDark: WoptaColors.primaryDark,
        primaryColorLight: WoptaColors.primaryLight,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: WoptaColors.primary,
          secondary: Colors.grey[300],
        ),
        backgroundColor: Colors.white,
        fontFamily: 'Montserrat',
        dividerTheme: const DividerThemeData(
          color: WoptaColors.primary,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          headline4: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          headline5: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          headline6: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontSize: 12.0,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
          subtitle2: TextStyle(
            fontSize: 18.0,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: WoptaColors.primary));
  }

  FilosofiaDialogTheme get dialogPrimaryTheme {
    return FilosofiaDialogTheme(
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      background: WoptaColors.primary,
    );
  }

  FilosofiaDialogTheme get dialogPrimaryDarkTheme {
    return FilosofiaDialogTheme(
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      background: WoptaColorsDark.primary,
    );
  }

  FilosofiaLinkTextTheme get linkTextPrimaryTheme {
    return FilosofiaLinkTextTheme(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      iconStyle: const IconThemeData(
        size: 20,
        color: Colors.white,
      ),
    );
  }

  FilosofiaStepperTheme get stepperPrimaryTheme {
    return FilosofiaStepperTheme(
      activeTitleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: WoptaColors.primary),
      inactiveTitleStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade400,
      ),
    );
  }
}

class FilosofiaDialogTheme {
  final TextStyle titleTextStyle;
  final TextStyle bodyTextStyle;
  final Color background;

  FilosofiaDialogTheme(
      {required this.titleTextStyle,
      required this.bodyTextStyle,
      required this.background});
}

class FilosofiaLinkTextTheme {
  final TextStyle textStyle;
  final IconThemeData iconStyle;

  FilosofiaLinkTextTheme({
    required this.textStyle,
    required this.iconStyle,
  });
}

class FilosofiaStepperTheme {
  final TextStyle activeTitleStyle;
  final TextStyle inactiveTitleStyle;

  FilosofiaStepperTheme({
    required this.activeTitleStyle,
    required this.inactiveTitleStyle,
  });
}

class FilosofiaTheme extends InheritedWidget {
  final theme = FilosofiaThemeData();
  final textTheme = FilosofiaTextTheme();
  final spacing = FilosofiaSpacing();

  FilosofiaTheme({super.key, required super.child});

  static FilosofiaTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FilosofiaTheme>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
