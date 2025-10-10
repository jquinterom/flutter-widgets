import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

// colors state
final colorsProvider = Provider<List<Color>>((ref) => AppTheme.colorsList);

// selected color state
final selectedColorProvider = StateProvider<int>((ref) => 0);
