import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color.fromARGB(255, 238, 0, 0);
  static const Color primaryVariant = Color(0xFF3700B3);
  static const Color secondary = Color.fromARGB(255, 255, 251, 12);
  static const Color secondaryVariant = Color(0xFF018786);
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFF121212);
  static const Color error = Color(0xFFCF6679);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF000000);
  static const Color onBackground = Color(0xFF000000);
  static const Color onSurface = Color(0xFFFFFFFF);
  static const Color onError = Color(0xFF000000);
  static const Color title = Color(0xFFFFFFFF);

  // Dark theme colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1F1F1F);
  static const Color darkOnBackground = Color(0xFFFFFFFF);
  static const Color darkOnSurface = Color(0xFFFFFFFF);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(AppColor.primary.value, <int, Color>{
          50: AppColor.primary.withOpacity(0.1),
          100: AppColor.primary.withOpacity(0.2),
          200: AppColor.primary.withOpacity(0.3),
          300: AppColor.primary.withOpacity(0.4),
          400: AppColor.primary.withOpacity(0.5),
          500: AppColor.primary.withOpacity(0.6),
          600: AppColor.primary.withOpacity(0.7),
          700: AppColor.primary.withOpacity(0.8),
          800: AppColor.primary.withOpacity(0.9),
          900: AppColor.primary.withOpacity(1),
        }),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.primary,
        titleSpacing: BorderSide.strokeAlignInside,
        titleTextStyle: TextStyle(
          color: AppColor.onPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
      scaffoldBackgroundColor: AppColor.background,
      listTileTheme: const ListTileThemeData(
        tileColor: AppColor.onSurface,
        
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(AppColor.primary.value, <int, Color>{
          50: AppColor.primary.withOpacity(0.1),
          100: AppColor.primary.withOpacity(0.2),
          200: AppColor.primary.withOpacity(0.3),
          300: AppColor.primary.withOpacity(0.4),
          400: AppColor.primary.withOpacity(0.5),
          500: AppColor.primary.withOpacity(0.6),
          600: AppColor.primary.withOpacity(0.7),
          700: AppColor.primary.withOpacity(0.8),
          800: AppColor.primary.withOpacity(0.9),
          900: AppColor.primary.withOpacity(1),
        }),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.primary,
      ),
      scaffoldBackgroundColor: AppColor.darkBackground,
      listTileTheme: const ListTileThemeData(
        tileColor: AppColor.darkSurface,
      ),
      
    );
  }
}
