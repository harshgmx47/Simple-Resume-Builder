import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/utils/colors/MyColors.dart';

class AppThemes {
  static final light = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily);
}
