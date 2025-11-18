import 'package:flutter/material.dart';

class VIB3Theme {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
    primaryColor: const Color(0xFF00FFFF),
    scaffoldBackgroundColor: const Color(0xFF000000),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF00FFFF),      // Cyan
      secondary: Color(0xFFFF00FF),    // Magenta
      tertiary: Color(0xFF00FF00),     // Green
      surface: Color(0xFF0A0A0A),
      error: Color(0xFFFF0000),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xFF00FFFF),
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFF00FF00),
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 12,
      ),
    ),
    sliderTheme: const SliderThemeData(
      activeTrackColor: Color(0xFF00FFFF),
      inactiveTrackColor: Color(0xFF003333),
      thumbColor: Color(0xFFFF00FF),
      overlayColor: Color(0x4DFF00FF),
    ),
  );
}
