import 'package:flutter/material.dart';
import 'package:corp_cab_app/app/theme/base/base_theme.dart';

final class DarkTheme extends BaseTheme {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  ColorScheme get colorScheme => _colorScheme;

  ColorScheme get _colorScheme {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffFFFFFF),
      onPrimary: Color(0xff140c0d),
      primaryContainer: Color(0xff6200ee),
      onPrimaryContainer: Color(0xffefdfff),
      secondary: Color(0xfffec802),
      onSecondary: Color(0xff6200ee),
      secondaryContainer: Color(0xff656cfb),
      onSecondaryContainer: Color(0xffdfe9e9),
      tertiary: Color(0xff656cfb),
      onTertiary: Color(0xff6200ee),
      tertiaryContainer: Color(0xff005047),
      onTertiaryContainer: Color(0xffdfecea),
      error: Color(0xffcf6679),
      onError: Color(0xff140c0d),
      errorContainer: Color(0xffb1384e),
      onErrorContainer: Color(0xfffbe8ec),
      surface: Color(0xff19161c),
      onSurface: Color(0xffececed),
      onSurfaceVariant: Color(0xffe0e0e1),
      outline: Color(0xff76767d),
      outlineVariant: Color(0xff2c2c2e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfffbf8fe),
      onInverseSurface: Color(0xff131313),
      inversePrimary: Color(0xff5f4876),
      surfaceTint: Color(0xffbb86fc),
    );
  }
}
