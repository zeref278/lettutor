import 'package:flutter/material.dart';


enum AppTheme {
  LightTheme,
  DarkTheme
}

final AppThemeData = {
  AppTheme.LightTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue
  ),

  AppTheme.DarkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700]
  )
};