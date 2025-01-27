import 'package:app/shared/resources/enums/app_style_enum.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  /// Define light theme
  ThemeData get lightTheme;

  /// Define dark theme
  ThemeData get darkTheme;

  /// Define high contrast light theme
  ThemeData get highContrastLightTheme;

  /// Define high contrast dark theme
  ThemeData get highContrastDarkTheme;

  /// Get the current theme mode
  AppThemeMode get currentThemeMode;

  /// Set the current theme mode
  void setThemeMode(AppThemeMode mode);

  /// Get the appropriate theme based on the mode
  ThemeData getTheme(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.dark:
        return darkTheme;
      case AppThemeMode.highContrastLight:
        return highContrastLightTheme;
      case AppThemeMode.highContrastDark:
        return highContrastDarkTheme;
      case AppThemeMode.light:
        return lightTheme;
    }
  }
}
