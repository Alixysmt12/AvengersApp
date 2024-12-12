import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_constants.dart';
import 'text_styles.dart';

class DarkTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorConstants.primaryColor,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      titleTextStyle: TextStyles.appBarTitleDark,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFBB86FC),
      secondary: Color(0xFF03DAC6),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.cabin(
        color: ColorConstants.textLight,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.cabin(
        color: ColorConstants.textLight,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.cabin(
        color: ColorConstants.textSecondary,
        fontSize: 14,
      ),
      headlineSmall: GoogleFonts.cabin(
        color: ColorConstants.textLight,
        fontSize: 24,
      ),
      headlineMedium: GoogleFonts.cabin(
        color: ColorConstants.textLight,
        fontSize: 28,
      ),
      titleLarge: GoogleFonts.cabin(
        color: ColorConstants.textLight,
        fontSize: 18,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFBB86FC),
        textStyle: TextStyles.buttonText,
      ),
    ),
  );
}
