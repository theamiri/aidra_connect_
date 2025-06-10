import 'package:flutter/material.dart';

class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary Brand Color
  static const Color primary = Color(0xFF2E6BE5);

  // Semantic Colors
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFF9500);
  static const Color error = Color(0xFFFF3B30);
  static const Color info = Color(0xFF007AFF);

  // Light Theme Colors
  static const Color lightScaffold = Color(0xFFF3F7FC);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF1C1C1E);
  static const Color lightSurfaceContainer = Color(0xFFE5E5EA);
  static const Color lightInputFill = Color(0xFFE9ECEF);
  static const Color lightDisabled = Color(0xFFE5E5EA);
  static const Color lightOnDisabled = Color(0xFF8E8E93);
  static const Color lightShadow = Color(0x1A000000);

  // Dark Theme Colors
  static const Color darkScaffold = Color(0xFF121A28);
  static const Color darkCard = Color(0xFF1C2332);
  static const Color darkOnSurface = Color(0xFFFFFFFF);
  static const Color darkSurfaceContainer = Color(0xFF2C3E50);
  static const Color darkInputFill = Color(0xFF2C3441);
  static const Color darkDisabled = Color(0xFF3A3A3C);
  static const Color darkOnDisabled = Color(0xFF8E8E93);
  static const Color darkShadow = Color(0x33000000);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF4A7FE7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Text Colors (Light Theme)
  static const Color lightTextPrimary = Color(0xFF1C1C1E);
  static const Color lightTextSecondary = Color(0xFF3C3C43);
  static const Color lightTextTertiary = Color(0xFF8E8E93);
  static const Color lightTextQuaternary = Color(0xFFC7C7CC);

  // Text Colors (Dark Theme)
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFEBEBF5);
  static const Color darkTextTertiary = Color(0xFF8E8E93);
  static const Color darkTextQuaternary = Color(0xFF48484A);

  // System Colors (Light Theme)
  static const Color lightSystemBlue = Color(0xFF007AFF);
  static const Color lightSystemGreen = Color(0xFF28A745);
  static const Color lightSystemOrange = Color(0xFFFF9500);
  static const Color lightSystemRed = Color(0xFFFF3B30);
  static const Color lightSystemYellow = Color(0xFFFFCC00);
  static const Color lightSystemPink = Color(0xFFFF2D92);
  static const Color lightSystemPurple = Color(0xFFAF52DE);
  static const Color lightSystemTeal = Color(0xFF59C8DE);
  static const Color lightSystemIndigo = Color(0xFF5856D6);

  // System Colors (Dark Theme)
  static const Color darkSystemBlue = Color(0xFF0A84FF);
  static const Color darkSystemGreen = Color(0xFF32D74B);
  static const Color darkSystemOrange = Color(0xFFFF9F0A);
  static const Color darkSystemRed = Color(0xFFFF453A);
  static const Color darkSystemYellow = Color(0xFFFFD60A);
  static const Color darkSystemPink = Color(0xFFFF375F);
  static const Color darkSystemPurple = Color(0xFFBF5AF2);
  static const Color darkSystemTeal = Color(0xFF64D2FF);
  static const Color darkSystemIndigo = Color(0xFF5E5CE6);

  // Helper methods to get theme-appropriate colors
  static Color getTextPrimary(bool isDark) {
    return isDark ? darkTextPrimary : lightTextPrimary;
  }

  static Color getTextSecondary(bool isDark) {
    return isDark ? darkTextSecondary : lightTextSecondary;
  }

  static Color getTextTertiary(bool isDark) {
    return isDark ? darkTextTertiary : lightTextTertiary;
  }

  static Color getCardColor(bool isDark) {
    return isDark ? darkCard : lightCard;
  }

  static Color getScaffoldColor(bool isDark) {
    return isDark ? darkScaffold : lightScaffold;
  }

  // Opacity variants for common use cases
  static Color withLightOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  // Common opacity levels following Apple guidelines
  static const double opacityHigh = 0.87;
  static const double opacityMedium = 0.60;
  static const double opacityLow = 0.38;
  static const double opacityDisabled = 0.12;
}
