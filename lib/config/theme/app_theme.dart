import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;

  static final colorsList = <Color>[
    Color(0xFF00C853),
    Color(0xFF00B140),
    Color(0xFFFFD600),
    Color(0xFFFB8C00),
    Color(0xFFFF6F00),
    Color(0xFFE65100),
    Color(0xFFD84315),
    Color(0xFFB0308A),
    Color(0xFF6F00F6),
    Color(0xFF4D00A1),
    Color(0xFF080058),
    Color(0xFF00148C),
    Color(0xFF0018A8),
    Color(0xFF0D47A1),
    Color(0xFF1976D2),
    Color(0xFF42A5F5),
    Color(0xFF7E57C2),
    Color(0xFFBB3E90),
    Color(0xFFEF5350),
    Color(0xFFF44336),
    Color(0xFFFF9800),
  ];

  final Brightness brightness;

  AppTheme({this.selectedColor = 0, required this.brightness})
    : assert(selectedColor >= 0, 'selected color must be greater than 0'),
      assert(
        selectedColor < colorsList.length,
        'selected color must be less than ${colorsList.length}',
      );

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorsList[selectedColor],
    brightness: brightness,
    appBarTheme: AppBarTheme(centerTitle: false),
  );
}
