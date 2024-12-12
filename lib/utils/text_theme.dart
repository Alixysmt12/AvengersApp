import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.lato(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFF5BAA15)),
    displayMedium: GoogleFonts.lato(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Color(0xFF667085)),
    displaySmall: GoogleFonts.lato(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
    headlineLarge: GoogleFonts.lato(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
    headlineMedium: GoogleFonts.lato(
        fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
    headlineSmall: GoogleFonts.lato(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xFF667085)),
    titleLarge: GoogleFonts.lato(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
    titleMedium: GoogleFonts.lato(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Color(0xFF667085)),
    titleSmall: GoogleFonts.lato(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xA88D8989)),
    bodyLarge: GoogleFonts.lato(
        fontSize: 18.0, fontWeight: FontWeight.normal, color: Color(0xFF000000)),
    bodyMedium: GoogleFonts.lato(
        fontSize: 16.0, fontWeight: FontWeight.normal, color: Color(0xFF000000)),
    bodySmall: GoogleFonts.lato(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Color(0xFF000000)),
    labelLarge: GoogleFonts.lato(
        fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
    labelMedium: GoogleFonts.lato(
        fontSize: 12.0, color: Color(0xFF000000)),
    labelSmall: GoogleFonts.lato(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xFFB00020)),

  );
}