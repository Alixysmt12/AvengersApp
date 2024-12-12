import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_constants.dart';
import 'text_styles.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorConstants.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF6200EA),
      titleTextStyle: TextStyles.appBarTitleLight,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF6200EA),
      secondary: Color(0xFF03DAC6),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.cabin(
        color: ColorConstants.accentColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.cabin(
        color: ColorConstants.textPrimary,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.cabin(
        color: ColorConstants.textSecondary,
        fontSize: 14,
      ),
      headlineSmall: GoogleFonts.cabin(
        color: ColorConstants.textPrimary,
        fontSize: 24,
      ),
      headlineMedium: GoogleFonts.cabin(
        color: ColorConstants.textPrimary,
        fontSize: 28,
      ),
      titleLarge: GoogleFonts.cabin(
        color: ColorConstants.textPrimary,
        fontSize: 18,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6200EA),
        textStyle: TextStyles.buttonText,
      ),
    ),
  );
}
