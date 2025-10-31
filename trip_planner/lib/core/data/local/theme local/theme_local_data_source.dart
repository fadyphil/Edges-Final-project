import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeLocalDataSource {
  final SharedPreferences _prefs;

  ThemeLocalDataSource(this._prefs);

  Future<ThemeMode> getThemeMode() async {
    final themeModeString = _prefs.getString('themeMode');
    if (themeModeString == null) {
      return ThemeMode.system;
    }
    return ThemeMode.values.firstWhere(
      (mode) => mode.toString() == themeModeString,
    );
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    await _prefs.setString('themeMode', themeMode.toString());
  }

  Future<void> clearAll() async {
    await _prefs.remove('themeMode');
  }
}
