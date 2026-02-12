import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

// ───────────────────────────────────────
// Brand Colors
// ───────────────────────────────────────
class AppColors {
  // Primary
  static const Color brandTeal = Color(0xFF26A69A);
  static const Color brandTealDark = Color(0xFF00897B);
  static const Color brandTealLight = Color(0xFF80CBC4);

  // Category Colors
  static const Color groceries = Color(0xFF26A69A);
  static const Color transport = Color(0xFF5C6BC0);
  static const Color kids = Color(0xFFFFB347);
  static const Color bills = Color(0xFFAB47BC);
  static const Color home = Color(0xFFFF7043);
  static const Color other = Color(0xFFEF6C6C);

  // Neutral
  static const Color darkBg = Color(0xFF0F1923);
  static const Color darkCard = Color(0xFF1A2634);
  static const Color darkSurface = Color(0xFF243447);
  static const Color lightBg = Color(0xFFF5F7FA);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFEEF2F7);

  // Text
  static const Color textDark = Color(0xFF1A1A2E);
  static const Color textLight = Color(0xFFF0F0F5);
  static const Color textMuted = Color(0xFF8E99A4);

  // Accent
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFEF5350);
}

// ───────────────────────────────────────
// Theme Data
// ───────────────────────────────────────
class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBg,
      colorScheme: const ColorScheme.light(
        primary: AppColors.brandTeal,
        secondary: AppColors.brandTealDark,
        surface: AppColors.lightCard,
        error: AppColors.error,
      ),
      textTheme: GoogleFonts.outfitTextTheme(
        ThemeData.light().textTheme,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.outfit(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
        iconTheme: const IconThemeData(color: AppColors.textDark),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.brandTeal,
        unselectedItemColor: AppColors.textMuted,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.brandTeal,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBg,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.brandTeal,
        secondary: AppColors.brandTealLight,
        surface: AppColors.darkCard,
        error: AppColors.error,
      ),
      textTheme: GoogleFonts.outfitTextTheme(
        ThemeData.dark().textTheme,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.outfit(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textLight,
        ),
        iconTheme: const IconThemeData(color: AppColors.textLight),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.brandTealLight,
        unselectedItemColor: AppColors.textMuted,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.brandTeal,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
    );
  }
}

// ───────────────────────────────────────
// Glassmorphism Decoration
// ───────────────────────────────────────
class GlassDecoration {
  static BoxDecoration card(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark
          ? Colors.white.withOpacity(0.08)
          : Colors.white.withOpacity(0.7),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isDark
            ? Colors.white.withOpacity(0.12)
            : Colors.white.withOpacity(0.5),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }
}
