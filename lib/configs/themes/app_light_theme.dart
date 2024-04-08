import 'package:flutter/material.dart';
import 'package:quizzy/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight =Color(0xFF3ac3cb);
const Color primaryColorLight =Color.fromARGB(255, 248, 48, 158);
const Color mainTextColorLight =Color.fromARGB(255, 40,40, 40);
const Color  cardColor =Color.fromARGB(253, 254, 254, 254);


 class LightTheme with SubThemeData{
  buildLightTheme(){
     final ThemeData systemLightTheme =ThemeData.light();
     return systemLightTheme.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: primaryColorLight,
      iconTheme: getIconTheme(),
      cardColor: cardColor,
      textTheme: getTextThemes().apply(
        bodyColor:mainTextColorLight ,
        displayColor:mainTextColorLight 
      )
     );
     
  }
}