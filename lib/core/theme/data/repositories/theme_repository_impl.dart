import 'package:shared_preferences/shared_preferences.dart';
import '../../../error/exceptions.dart';
import '../../../error/failures.dart';
import '../../../usecases/usecase.dart';
import '../../bloc/theme_state.dart';
import '../../domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  static const String _themeKey = 'app_theme_mode';
  final SharedPreferences sharedPreferences;

  ThemeRepositoryImpl({required this.sharedPreferences});

  @override
  Future<Result<AppThemeMode>> getSavedTheme() async {
    try {
      final savedTheme = sharedPreferences.getString(_themeKey);
      if (savedTheme != null) {
        final themeMode = AppThemeMode.values.firstWhere(
          (mode) => mode.toString() == savedTheme,
          orElse: () => AppThemeMode.system,
        );
        return Success(themeMode);
      } else {
        // Return system theme as default
        return const Success(AppThemeMode.system);
      }
    } catch (e) {
      return Error(
        CacheFailure(message: 'Failed to get saved theme: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<void>> saveTheme(AppThemeMode themeMode) async {
    try {
      final success = await sharedPreferences.setString(
        _themeKey,
        themeMode.toString(),
      );
      if (success) {
        return const Success(null);
      } else {
        return const Error(
          CacheFailure(message: 'Failed to save theme to cache'),
        );
      }
    } catch (e) {
      return Error(
        CacheFailure(message: 'Failed to save theme: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<void>> clearSavedTheme() async {
    try {
      final success = await sharedPreferences.remove(_themeKey);
      if (success) {
        return const Success(null);
      } else {
        return const Error(
          CacheFailure(message: 'Failed to clear saved theme'),
        );
      }
    } catch (e) {
      return Error(
        CacheFailure(message: 'Failed to clear theme: ${e.toString()}'),
      );
    }
  }
}
