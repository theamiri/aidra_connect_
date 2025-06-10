import '../../../usecases/usecase.dart';
import '../repositories/theme_repository.dart';
import '../../bloc/theme_state.dart';

class GetSavedTheme implements UseCaseNoParams<AppThemeMode> {
  final ThemeRepository repository;

  GetSavedTheme(this.repository);

  @override
  Future<Result<AppThemeMode>> call() async {
    return await repository.getSavedTheme();
  }
}
