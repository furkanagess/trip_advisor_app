import 'package:flutter/material.dart';
import 'package:trip_advisor_app/core/init/theme/app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData.light();
}
