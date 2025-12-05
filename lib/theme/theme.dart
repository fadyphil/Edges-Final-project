// lib/core/theme/theme.dart
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // --- COLOR DEFINITIONS ---
  static const Color _primaryBlue = Color(0xFF0A2E46);
  static const Color _accentCoral = Color(0xFFFF6B6B);
  static const Color _surfaceLight = Color(0xFFF8F9FA);
  static const Color _secondarySand = Color(0xFFEAE2D6);
  static const Color _darkCard = Color(0xFF1A3F5A);

  // --- LIGHT THEME ---
  static final ThemeData lightTheme = FlexThemeData.light(
    // THE FIX: appBarBackground is a direct property of FlexThemeData.light
    appBarBackground: _surfaceLight,
    colors: const FlexSchemeColor(
      primary: _primaryBlue,
      secondary: _accentCoral,
      tertiary: _secondarySand,
      // REMOVED appBarBackground from here
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      defaultRadius: 24.0,
      chipSchemeColor: SchemeColor.primary,
      inputDecoratorSchemeColor: SchemeColor.secondary,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      // THE FIX: bottomNavigationBarSchemeColor belongs here.
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  // --- DARK THEME ---
  static final ThemeData darkTheme = FlexThemeData.dark(
    // THE FIX: appBarBackground is a direct property of FlexThemeData.dark
    appBarBackground: _darkCard,
    scaffoldBackground: _primaryBlue,
    colors: const FlexSchemeColor(
      primary: _surfaceLight,
      secondary: _accentCoral,
      tertiary: _secondarySand,
      // REMOVED appBarBackground from here
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      defaultRadius: 24.0,
      chipSchemeColor: SchemeColor.primary,
      inputDecoratorSchemeColor: SchemeColor.secondary,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      // THE FIX: bottomNavigationBarSchemeColor belongs here.
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
}
