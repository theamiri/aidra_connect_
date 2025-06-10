abstract class Failure {
  const Failure();
}

// General failures
class ServerFailure extends Failure {
  final String message;

  const ServerFailure({required this.message});
}

class CacheFailure extends Failure {
  final String message;

  const CacheFailure({required this.message});
}

class NetworkFailure extends Failure {
  final String message;

  const NetworkFailure({required this.message});
}

class ValidationFailure extends Failure {
  final String message;

  const ValidationFailure({required this.message});
}

class AuthenticationFailure extends Failure {
  final String message;

  const AuthenticationFailure({required this.message});
}

class AuthorizationFailure extends Failure {
  final String message;

  const AuthorizationFailure({required this.message});
}

class UnexpectedFailure extends Failure {
  final String message;

  const UnexpectedFailure({required this.message});
}
