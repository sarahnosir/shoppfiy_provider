import 'package:flutter/material.dart';

class ThemeUtils {
  static ThemeData themeData = ThemeData(
    fontFamily: 'NeusaNextStd',
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            color: Color(0xff515C6F),
            fontSize: 30,
            fontWeight: FontWeight.w600),
        displayLarge: TextStyle(
            color: Color(0xff617b33),
            fontSize: 22,
            fontWeight: FontWeight.w500),
        displayMedium: TextStyle(
            color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w500)),
    colorScheme:
        ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 105, 105)),
    useMaterial3: true,
  );
}
