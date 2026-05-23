// lib/core/theme/theme_controller.dart
import 'package:flutter/material.dart';

enum AppThemeMode {
  system,
  light,
  dark,
}

extension AppThemeModeX on AppThemeMode {
  ThemeMode get toThemeMode {
    switch (this) {
      case AppThemeMode.system:
        return ThemeMode.system;
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
    }
  }

  static AppThemeMode fromString(String value) {
    return AppThemeMode.values.firstWhere(
          (e) => e.name == value,
      orElse: () => AppThemeMode.system,
    );
  }
}
