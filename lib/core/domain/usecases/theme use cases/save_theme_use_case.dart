import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trip_planner/core/domain/repo/theme_repository.dart';

class SaveThemeUseCase {
  final ThemeRepository _themeRepository;

  SaveThemeUseCase(this._themeRepository);

  Future<void> call(ThemeMode themeMode) async {
    try {
      await _themeRepository.saveThemeMode(themeMode);
    } catch (e) {
      log(
        '❌ ERROR in SaveThemeUseCase: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }
}
