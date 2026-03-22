import 'package:flutter/material.dart';

class AppTheme {
  // ═══════════════════════════════════════════════════════════════
  // SURGICAL PRECISION — Dark, high-contrast, instrument-inspired
  // ═══════════════════════════════════════════════════════════════

  // Core dark surfaces
  static const Color backgroundDark = Color(0xFF0F1419);     // Near-black
  static const Color surfaceDark = Color(0xFF1A1F2E);        // Dark slate card
  static const Color surfaceElevated = Color(0xFF232A3B);    // Elevated surface
  static const Color surfaceBorder = Color(0xFF2E3648);      // Subtle border
  static const Color surfaceHover = Color(0xFF2A3245);       // Hover state

  // Legacy names for compatibility
  static const Color primaryNavy = backgroundDark;
  static const Color surfaceLight = backgroundDark;
  static const Color cardBackground = surfaceDark;

  // Accent colors — sharp, clinical
  static const Color accentTeal = Color(0xFF00D4AA);         // Bright surgical teal
  static const Color accentTealDim = Color(0xFF0D9488);      // Subdued teal
  static const Color warningAmber = Color(0xFFFFB020);       // Warm instrument amber
  static const Color dangerRed = Color(0xFFFF4757);          // Alert red
  static const Color successGreen = Color(0xFF2ED573);       // Confirm green

  // Text hierarchy
  static const Color textPrimary = Color(0xFFE8ECF4);        // Bright white-blue
  static const Color textSecondary = Color(0xFF8892A4);      // Muted
  static const Color textTertiary = Color(0xFF5A6478);       // Faint

  // Module-specific colors — vivid on dark
  static const Color fundamentalsColor = Color(0xFF4DA6FF);
  static const Color leOrthosesColor = Color(0xFFA78BFA);
  static const Color ueOrthosesColor = Color(0xFF38BDF8);
  static const Color spinalOrthosesColor = Color(0xFF818CF8);
  static const Color prostheticComponentsColor = Color(0xFFFF6B6B);
  static const Color transtibialColor = Color(0xFF9B7BF7);
  static const Color transfemoralColor = Color(0xFFFF8C42);
  static const Color ueProstheticsColor = Color(0xFF00D4AA);
  static const Color gaitAnalysisColor = Color(0xFFFF5A8A);
  static const Color materialsColor = Color(0xFF5B9EFF);
  static const Color pediatricColor = Color(0xFFB07DFF);
  static const Color advancedTechColor = Color(0xFF34D399);
  static const Color amputationRehabColor = Color(0xFFFFAA5B);
  static const Color specialPopulationsColor = Color(0xFF22D3EE);

  static const List<Color> moduleColors = [
    fundamentalsColor, leOrthosesColor, ueOrthosesColor,
    spinalOrthosesColor, prostheticComponentsColor, transtibialColor,
    transfemoralColor, ueProstheticsColor, gaitAnalysisColor,
    materialsColor, pediatricColor, advancedTechColor,
    amputationRehabColor, specialPopulationsColor,
  ];

  // Content block accents
  static const Color pearlBackground = Color(0xFF2A2415);
  static const Color pearlBorder = Color(0xFFFFB020);
  static const Color mnemonicBackground = Color(0xFF1F1A2E);
  static const Color mnemonicBorder = Color(0xFF9B7BF7);
  static const Color avoidBackground = Color(0xFF2A1519);
  static const Color avoidBorder = Color(0xFFFF4757);

  // Glow effects
  static BoxShadow glowTeal([double opacity = 0.3]) => BoxShadow(
    color: accentTeal.withValues(alpha: opacity),
    blurRadius: 16,
    spreadRadius: -2,
  );

  static BoxShadow glowColor(Color color, [double opacity = 0.25]) => BoxShadow(
    color: color.withValues(alpha: opacity),
    blurRadius: 12,
    spreadRadius: -2,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accentTeal,
        brightness: Brightness.dark,
        surface: surfaceDark,
      ),
      scaffoldBackgroundColor: backgroundDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundDark,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: textPrimary,
          letterSpacing: 0.5,
        ),
      ),
      cardTheme: CardThemeData(
        color: surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: surfaceBorder, width: 1),
        ),
      ),
      dividerColor: surfaceBorder,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          color: textPrimary,
          letterSpacing: -0.5,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          color: textPrimary,
          letterSpacing: -0.3,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.5,
          color: textSecondary,
        ),
      ),
    );
  }
}
