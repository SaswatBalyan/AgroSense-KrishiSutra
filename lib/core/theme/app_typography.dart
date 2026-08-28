import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  AppTypography._();

  // Font families
  static const String _geistSans = 'GeistSans';
  static const String _outfit = 'Outfit';

  static final TextTheme textTheme = TextTheme(
    // Display text (formerly displayLarge/Medium/Small)
    displayLarge: TextStyle(
      fontFamily: _geistSans,
      fontSize: 72,
      fontWeight: FontWeight.w800,
      color: AppColors.textPrimary,
      letterSpacing: -2.4,
      height: 1.1,
    ),
    displayMedium: TextStyle(
      fontFamily: _geistSans,
      fontSize: 56,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
      letterSpacing: -1.6,
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontFamily: _geistSans,
      fontSize: 44,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
      letterSpacing: -1.2,
      height: 1.2,
    ),
    // Headlines
    headlineLarge: TextStyle(
      fontFamily: _geistSans,
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      letterSpacing: -0.8,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontFamily: _geistSans,
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      letterSpacing: -0.4,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontFamily: _geistSans,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      letterSpacing: -0.2,
      height: 1.4,
    ),
    // Titles
    titleLarge: TextStyle(
      fontFamily: _outfit,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      letterSpacing: 0.15,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontFamily: _outfit,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      letterSpacing: 0.1,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontFamily: _outfit,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      letterSpacing: 0.05,
      height: 1.4,
    ),
    // Body text with improved hierarchy
    bodyLarge: TextStyle(
      fontFamily: _geistSans,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
      letterSpacing: 0.25,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: _geistSans,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
      letterSpacing: 0.25,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontFamily: _geistSans,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      letterSpacing: 0.25,
      height: 1.5,
    ),
    // Labels and buttons with stronger hierarchy
    labelLarge: TextStyle(
      fontFamily: _outfit,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      letterSpacing: 0.5,
      height: 1.3,
    ),
    labelMedium: TextStyle(
      fontFamily: _outfit,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      letterSpacing: 0.5,
      height: 1.3,
    ),
    labelSmall: TextStyle(
      fontFamily: _outfit,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
      letterSpacing: 0.8,
      height: 1.3,
    ),
  );

  static const TextStyle bodyTextMono = TextStyle(
    fontFamily: 'GeistMono',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    letterSpacing: 0.25,
  );
}
