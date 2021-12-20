import 'package:flutter/material.dart';

final ThemeData theme = ThemeData.dark();

final _primary = const Color.fromRGBO(38, 44, 50, .9);
final _secondary = const Color.fromRGBO(20, 92, 150, 1);

final _colorScheme =
    theme.colorScheme.copyWith(primary: _primary, secondary: _secondary);

final _appBarTheme = theme.appBarTheme.copyWith(backgroundColor: _primary);

final _textTheme = theme.textTheme.copyWith(
    headline1: theme.textTheme.headline1!
        .copyWith(fontSize: 24, fontWeight: FontWeight.bold, color: _colorScheme.onPrimary),
    headline2: theme.textTheme.headline2!
        .copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: _colorScheme.onPrimary),
    bodyText1: theme.textTheme.bodyText1!.copyWith(fontSize: 16,color: _colorScheme.onPrimary),
    bodyText2: theme.textTheme.bodyText2!.copyWith(fontSize: 14,color: _colorScheme.onPrimary));

ThemeData getTheme() {
  return theme.copyWith(
      colorScheme: _colorScheme,
      appBarTheme: _appBarTheme,
      textTheme: _textTheme,
      scaffoldBackgroundColor: _primary,
      backgroundColor: Color.fromRGBO(30, 38, 45, .9),
      cardColor: Color.fromRGBO(48, 54, 60, .9),
      bottomAppBarColor: Color.fromRGBO(48, 54, 60, .9),
      navigationRailTheme: NavigationRailThemeData(
          backgroundColor: Color.fromRGBO(48, 54, 60, .9)),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(24)),
              foregroundColor: MaterialStateProperty.all(Colors.white))));
}
