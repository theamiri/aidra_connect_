import '../../../usecases/usecase.dart';
import '../../bloc/theme_state.dart';

abstract class ThemeRepository {
  Future<Result<AppThemeMode>> getSavedTheme();
  Future<Result<void>> saveTheme(AppThemeMode themeMode);
  Future<Result<void>> clearSavedTheme();
}
