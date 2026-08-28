import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary accent colors (current design palette)
  static const Color moss = Color(0xFF6D7B38);
  static const Color sage = Color(0xFF98B185);
  static const Color tangerine = Color(0xFFEC9907);
  static const Color dawn = Color(0xFFF2F0E2);
  static const Color juniper = Color(0xFF506544);

  // New neutral palette (single family with consistent hue)
  static const Color slate = Color(0xFF0F1318);
  static const Color charcoal = Color(0xFF1A222B);
  static const Color carbon = Color(0xFF2A2F38);
  static const Color graphite = Color(0xFF3A424C);
  static const Color steel = Color(0xFF505864);
  static const Color zinc = Color(0xFF6A7280);
  static const Color lead = Color(0xFF848A95);
  static const Color aluminum = Color(0xFF9EA4B2);
  static const Color silver = Color(0xFFBABFC8);
  static const Color zincLight = Color(0xFFD2D6DE);
  static const Color aluminumLight = Color(0xFFE8ECF2);
  static const Color mist = Color(0xFFF5F7FA);

  // New accent palette (single dominant accent)
  static const Color jade = Color(0xFF2E7D32);      // Deep green
  static const Color warmSage = Color(0xFF8BC34A); // Warm green (renamed to avoid conflict)
  static const Color amber = Color(0xFFFFB300);    // Warm amber
  static const Color coral = Color(0xFFFF6B6B);    // Warm coral
  static const Color lavender = Color(0xFF9C27B0); // Soft purple

  // Surface and UI
  static const Color background = mist;
  static const Color surface = Colors.white;
  static const Color surfaceLight = zincLight;
  static const Color card = Colors.white;
  static const Color hairline = aluminumLight;
  static const Color overlay = Color.fromRGBO(0, 0, 0, 0.4);

  // Text
  static const Color textPrimary = charcoal;
  static const Color textSecondary = graphite;
  static const Color textDisabled = zinc;
  static const Color textInverted = Colors.white;

  // Semantic
  static const Color success = jade;
  static const Color warning = amber;
  static const Color error = coral;
  static const Color info = lavender;

  // Special purpose (for groundwater zones etc.)
  static const Color blueZone = Color(0xFF1976D2);      // Clear blue
  static const Color redZone = Color(0xFFD32F2F);       // Clear red
  static const Color yellowZone = Color(0xFFFBC02D);   // Clear yellow
  static const Color orangeZone = Color(0xFFF57C00);   // Clear orange
  static const Color greenZone = Color(0xFF388E3C);     // Clear green
  static const Color purpleZone = Color(0xFF7B1FA2);   // Clear purple

}


