import 'package:flutter/material.dart';

enum AppTheme {
  lightTheme,
  darkTheme
}

final AppThemeData = {
  AppTheme.lightTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue
  ),

  AppTheme.darkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700]
  )
};