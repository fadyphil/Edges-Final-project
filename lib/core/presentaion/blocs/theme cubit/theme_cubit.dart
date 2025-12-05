import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/domain/usecases/theme%20use%20cases/get_theme_use_case.dart';
import 'package:trip_planner/core/domain/usecases/theme%20use%20cases/save_theme_use_case.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final SaveThemeUseCase _saveThemeUseCase;
  final GetThemeUseCase _getThemeUseCase;
  ThemeCubit(this._saveThemeUseCase, this._getThemeUseCase)
    : super(ThemeMode.system);

  Future<void> toggleTheme() {
    final newTheme = state == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    emit(newTheme);
    return _saveThemeUseCase(newTheme);
  }

  Future<void> loadTheme() async {
    try {
      final themeMode = await _getThemeUseCase();
      emit(themeMode);
    } catch (e) {
      emit(ThemeMode.system);
    }
  }
}
