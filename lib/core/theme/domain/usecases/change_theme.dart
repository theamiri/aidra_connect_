import '../../../usecases/usecase.dart';
import '../repositories/theme_repository.dart';
import '../../bloc/theme_state.dart';

class ChangeTheme implements UseCaseNoReturn<AppThemeMode> {
  final ThemeRepository repository;

  ChangeTheme(this.repository);

  @override
  Future<Result<void>> call(AppThemeMode params) async {
    return await repository.saveTheme(params);
  }
}
