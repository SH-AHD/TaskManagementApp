import 'package:flutter/material.dart';
import 'package:taskati/core/services/shared_pref.dart';

extension ThemeExtension on BuildContext{
    bool get isDark=>SharedPref.getCachedThemeMode();
ThemeData get theme=> Theme.of(this);
Color get cardColor=>theme.cardColor;
Color? get iconColor=> theme.iconTheme.color;
}