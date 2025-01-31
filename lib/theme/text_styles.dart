import 'package:flutter/material.dart';

class TextStyles {
  // Light Theme Text Styles
  static const TextStyle appBarTitleLight = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle headingLight = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyLight = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Dark Theme Text Styles
  static const TextStyle appBarTitleDark = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle headingDark = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle bodyDark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.white70,
  );

  static const TextTheme textThemeLight = TextTheme(
    displayLarge: headingLight, // previously headline1
    bodyLarge: bodyLight,       // previously bodyText1
    bodyMedium: bodyLight,      // previously bodyText2
    labelLarge: buttonText,     // for buttons
  );

  static const TextTheme textThemeDark = TextTheme(
    displayLarge: headingDark, // previously headline1
    bodyLarge: bodyDark,       // previously bodyText1
    bodyMedium: bodyDark,      // previously bodyText2
    labelLarge: buttonText,    // for buttons
  );
}
