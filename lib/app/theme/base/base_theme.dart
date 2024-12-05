import 'package:flutter/material.dart';

abstract class BaseTheme {
  Brightness get brightness;
  ColorScheme get colorScheme;

  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      fontFamily: 'Montserrat',
      elevatedButtonTheme:  ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
      // //TODO: Customize widgets here
      // typography: Typography.material2021(),
    );
  }
}
