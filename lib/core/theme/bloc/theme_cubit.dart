import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_theme.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = 'theme_mode';
  final SharedPreferences _prefs;

  ThemeCubit(this._prefs)
    : super(
        ThemeState(
          themeMode: AppThemeMode.system,
          lightTheme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
        ),
      ) {
    _loadTheme();
  }

  // Load saved theme from SharedPreferences
  void _loadTheme() {
    final savedTheme = _prefs.getString(_themeKey);
    if (savedTheme != null) {
      final themeMode = AppThemeMode.values.firstWhere(
        (mode) => mode.toString() == savedTheme,
        orElse: () => AppThemeMode.system,
      );
      emit(state.copyWith(themeMode: themeMode));
    }
  }

  // Change theme and save to preferences
  Future<void> changeTheme(AppThemeMode themeMode) async {
    try {
      await _prefs.setString(_themeKey, themeMode.toString());
      emit(state.copyWith(themeMode: themeMode));
    } catch (e) {
      // Handle error silently or emit error state if needed
      // For now, we'll just not save to preferences but still emit the state
      emit(state.copyWith(themeMode: themeMode));
    }
  }

  // Toggle between light and dark (skipping system)
  Future<void> toggleTheme() async {
    final newTheme = state.themeMode == AppThemeMode.light
        ? AppThemeMode.dark
        : AppThemeMode.light;
    await changeTheme(newTheme);
  }

  // Set light theme
  Future<void> setLightTheme() async {
    await changeTheme(AppThemeMode.light);
  }

  // Set dark theme
  Future<void> setDarkTheme() async {
    await changeTheme(AppThemeMode.dark);
  }

  // Set system theme
  Future<void> setSystemTheme() async {
    await changeTheme(AppThemeMode.system);
  }

  // Check if current theme is dark
  bool get isDarkMode => state.themeMode == AppThemeMode.dark;

  // Check if current theme is light
  bool get isLightMode => state.themeMode == AppThemeMode.light;

  // Check if current theme follows system
  bool get isSystemMode => state.themeMode == AppThemeMode.system;

  // Get current theme mode as string for UI display
  String get currentThemeName {
    switch (state.themeMode) {
      case AppThemeMode.light:
        return 'Light';
      case AppThemeMode.dark:
        return 'Dark';
      case AppThemeMode.system:
        return 'System';
    }
  }
}
