import '../error/failures.dart';

// Generic UseCase interface
abstract class UseCase<Type, Params> {
  Future<Result<Type>> call(Params params);
}

// Use case for operations that don't need parameters
abstract class UseCaseNoParams<Type> {
  Future<Result<Type>> call();
}

// Use case for operations that don't return data
abstract class UseCaseNoReturn<Params> {
  Future<Result<void>> call(Params params);
}

// Use case for operations that don't need parameters and don't return data
abstract class UseCaseNoParamsNoReturn {
  Future<Result<void>> call();
}

// Result wrapper to handle success/failure states
abstract class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Result<T> {
  final Failure failure;
  const Error(this.failure);
}

// Helper class for use cases that don't need parameters
class NoParams {
  const NoParams();
}
