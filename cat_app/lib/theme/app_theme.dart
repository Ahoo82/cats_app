import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ColorScheme _colorScheme =
      ColorScheme.fromSeed(
        seedColor: const Color(0xFF5C8D5A),
        brightness: Brightness.light,
      ).copyWith(
        surface: const Color(0xFFFAFAF8),
        secondary: const Color(0xFFE8B86D),
        secondaryContainer: const Color(0xFFFBE8C6),
        onSecondaryContainer: const Color(0xFF3E2A00),
        tertiary: const Color(0xFFE8B86D),
        tertiaryContainer: const Color(0xFFFBE8C6),
        onTertiaryContainer: const Color(0xFF3E2A00),
      );

  static final ColorScheme _darkColorScheme =
      ColorScheme.fromSeed(
        seedColor: const Color(0xFF5C8D5A),
        brightness: Brightness.dark,
      ).copyWith(
        secondary: const Color(0xFFE8B86D),
        tertiary: const Color(0xFFE8B86D),
      );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Vazirmatn',
    colorScheme: _colorScheme,
    visualDensity: VisualDensity.comfortable,
    scaffoldBackgroundColor: _colorScheme.surface,
    cardTheme: CardThemeData(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.05),
      surfaceTintColor: Colors.transparent,
      color: _colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0.5,
      backgroundColor: _colorScheme.surface,
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      backgroundColor: _colorScheme.surface,
      height: 80,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      side: BorderSide.none,
      backgroundColor: _colorScheme.primary.withValues(alpha: 0.08),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Vazirmatn',
    colorScheme: _darkColorScheme,
    visualDensity: VisualDensity.comfortable,
    scaffoldBackgroundColor: _darkColorScheme.surface,
    cardTheme: CardThemeData(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.15),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0.5,
      backgroundColor: _darkColorScheme.surface,
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      backgroundColor: _darkColorScheme.surface,
      height: 80,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      side: BorderSide.none,
      backgroundColor: _darkColorScheme.primary.withValues(alpha: 0.15),
    ),
  );
}
