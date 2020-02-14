import 'package:flutter/material.dart';

final mainColor = const MaterialColor(0xff00b2e5, const <int, Color>{
  50: const Color(0xff00b2e5),
  100: const Color(0xff00b2e5),
  200: const Color(0xff00b2e5),
  300: const Color(0xff00b2e5),
  400: const Color(0xff00b2e5),
  500: const Color(0xff00b2e5),
  600: const Color(0xff00b2e5),
  700: const Color(0xff00b2e5),
  800: const Color(0xff00b2e5),
  900: const Color(0xff00b2e5),
});

final mainTheme = ThemeData(
  // Colors
  primarySwatch: mainColor,
  backgroundColor: Colors.white,

  primaryColor: Colors.black,
  accentColor: Colors.white,

  primaryTextTheme: TextTheme(button: TextStyle(color: mainColor)),

  // AppBar
  appBarTheme: AppBarTheme(
    brightness: Brightness.light,
    color: Colors.white,
    textTheme: TextTheme(
      title: TextStyle(color: Colors.black, fontSize: 22),
    ),
  ),

  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.accent,
    minWidth: double.infinity,
    height: 44.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  ),

  // FloatingActionButton
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
  ),
);
