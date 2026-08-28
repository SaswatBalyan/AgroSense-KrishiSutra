import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.jade,
        onPrimary: Colors.white,
        secondary: AppColors.sage,
        onSecondary: AppColors.textPrimary,
        tertiary: AppColors.amber,
        onTertiary: AppColors.textPrimary,
        background: AppColors.background,
        onBackground: AppColors.textPrimary,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        error: AppColors.error,
        onError: Colors.white,
      ),
      textTheme: AppTypography.textTheme.apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
      pageTransitionsTheme: _polishedPageTransitions,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        shadowColor: AppColors.carbon.withValues(alpha: 0.1),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.jade,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          textStyle: AppTypography.textTheme.labelLarge,
          elevation: 2,
          shadowColor: AppColors.jade.withValues(alpha: 0.2),
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.jade.withValues(alpha: 0.08);
            }
            if (states.contains(WidgetState.hovered)) {
              return AppColors.jade.withValues(alpha: 0.04);
            }
            return null;
          }),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.jade,
          minimumSize: const Size(double.infinity, 56),
          side: const BorderSide(color: AppColors.jade, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          textStyle: AppTypography.textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.jade,
          minimumSize: const Size(double.infinity, 44),
          textStyle: AppTypography.textTheme.labelLarge,
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.jade.withValues(alpha: 0.08);
            }
            if (states.contains(WidgetState.hovered)) {
              return AppColors.jade.withValues(alpha: 0.04);
            }
            return null;
          }),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLight,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.hairline, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.hairline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.jade, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        labelStyle: AppTypography.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
        hintStyle: AppTypography.textTheme.bodyMedium?.copyWith(color: AppColors.textDisabled),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceLight,
        selectedColor: AppColors.sage.withValues(alpha: 0.2),
        labelStyle: AppTypography.textTheme.labelMedium,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.hairline,
        thickness: 1,
        space: 0,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.card,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.slate,
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: AppColors.sage,
        onPrimary: AppColors.textPrimary,
        secondary: AppColors.tangerine,
        onSecondary: AppColors.textPrimary,
        tertiary: AppColors.lavender,
        onTertiary: AppColors.textPrimary,
        background: AppColors.slate,
        onBackground: AppColors.aluminumLight,
        surface: AppColors.carbon,
        onSurface: AppColors.aluminumLight,
        error: AppColors.error,
        onError: AppColors.textPrimary,
      ),
      textTheme: AppTypography.textTheme.apply(
        bodyColor: AppColors.aluminumLight,
        displayColor: AppColors.aluminumLight,
      ),
      pageTransitionsTheme: _polishedPageTransitions,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.slate,
        foregroundColor: AppColors.aluminumLight,
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        color: AppColors.carbon,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        shadowColor: Colors.black.withValues(alpha: 0.3),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.sage,
          foregroundColor: AppColors.textPrimary,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          textStyle: AppTypography.textTheme.labelLarge,
          elevation: 2,
          shadowColor: AppColors.sage.withValues(alpha: 0.2),
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.sage.withValues(alpha: 0.08);
            }
            if (states.contains(WidgetState.hovered)) {
              return AppColors.sage.withValues(alpha: 0.04);
            }
            return null;
          }),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.sage,
          minimumSize: const Size(double.infinity, 56),
          side: const BorderSide(color: AppColors.sage, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          textStyle: AppTypography.textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.carbon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.graphite, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.graphite, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.sage, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        labelStyle: AppTypography.textTheme.bodyMedium?.copyWith(color: AppColors.aluminum),
        hintStyle: AppTypography.textTheme.bodyMedium?.copyWith(color: AppColors.zinc),
      ),
    );
  }
}

const _polishedPageTransitions = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: _PolishedPageTransitionsBuilder(),
    TargetPlatform.iOS: _PolishedPageTransitionsBuilder(),
    TargetPlatform.macOS: _PolishedPageTransitionsBuilder(),
    TargetPlatform.windows: _PolishedPageTransitionsBuilder(),
    TargetPlatform.linux: _PolishedPageTransitionsBuilder(),
    TargetPlatform.fuchsia: _PolishedPageTransitionsBuilder(),
  },
);

class _PolishedPageTransitionsBuilder extends PageTransitionsBuilder {
  const _PolishedPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final easedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    return FadeTransition(
      opacity: easedAnimation,
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.985, end: 1).animate(easedAnimation),
        child: child,
      ),
    );
  }
}
