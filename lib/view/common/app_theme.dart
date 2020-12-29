import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color.fromRGBO(38, 44, 50, .9),
      backgroundColor: Color.fromRGBO(30, 38, 45, .9),
      accentColor: Color.fromRGBO(20, 92, 150, 1),
      cardColor: Color.fromRGBO(48, 54, 60, .9),
      bottomAppBarColor: Color.fromRGBO(48, 54, 60, .9),
      navigationRailTheme: NavigationRailThemeData(
          backgroundColor: Color.fromRGBO(48, 54, 60, .9)),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(24)),
              foregroundColor: MaterialStateProperty.all(Colors.white))));
}
