import 'package:flutter/material.dart';
import 'package:trip_planner/core/data/local/theme%20local/theme_local_data_source.dart';
import 'package:trip_planner/core/domain/repo/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource _themeLocalDataSource;

  ThemeRepositoryImpl(this._themeLocalDataSource);

  @override
  Future<ThemeMode> getThemeMode() {
    return _themeLocalDataSource.getThemeMode();
  }

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) {
    return _themeLocalDataSource.saveThemeMode(themeMode);
  }
}
