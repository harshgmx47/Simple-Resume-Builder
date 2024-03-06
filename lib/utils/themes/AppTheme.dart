import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/utils/colors/MyColors.dart';

/// Custom Class for storing App Theme
class AppThemes {
  AppThemes._();
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.black,
    cardColor: MyColors.primaryColor,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.aBeeZee(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayMedium: GoogleFonts.aBeeZee(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: GoogleFonts.aBeeZee(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.aBeeZee(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.aBeeZee(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade600,
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    cardColor: MyColors.primaryColor,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.aBeeZee(
        fontSize: 35,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.aBeeZee(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: GoogleFonts.aBeeZee(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.aBeeZee(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.aBeeZee(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade400,
      ),
    ),
  );
}
