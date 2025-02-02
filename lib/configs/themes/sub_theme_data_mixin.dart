import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzy/configs/themes/appColors.dart';

mixin SubThemeData {
    TextTheme getTextThemes() {
   return GoogleFonts.quicksandTextTheme(const TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(fontWeight: FontWeight.w400)));
  }
  IconThemeData getIconTheme(){
    return const IconThemeData(color: onSurfaceTextColor, size: 35);
  }
}
