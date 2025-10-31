import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trip_planner/core/domain/repo/theme_repository.dart';

class GetThemeUseCase {
  final ThemeRepository _themeRepository;

  GetThemeUseCase(this._themeRepository);

  Future<ThemeMode> call() async {
    try {
      return await _themeRepository.getThemeMode();
    } catch (e) {
      log(
        '❌ ERROR in GetThemeUseCase: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      return ThemeMode.system; // Default to system theme on error
    }
  }
}
