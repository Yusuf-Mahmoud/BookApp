import 'package:flutter/material.dart';

const appBackgroundColor = Color(0xFF0F0F1E);
const appAccentColor = Colors.cyanAccent;

final ThemeData appTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: appBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
  ),
  colorScheme: ColorScheme.dark(
    primary: appAccentColor,
    secondary: appAccentColor,
  ),
);
