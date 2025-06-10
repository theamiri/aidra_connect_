class ServerException implements Exception {
  final String message;

  const ServerException({required this.message});

  @override
  String toString() => 'ServerException: $message';
}

class CacheException implements Exception {
  final String message;

  const CacheException({required this.message});

  @override
  String toString() => 'CacheException: $message';
}

class NetworkException implements Exception {
  final String message;

  const NetworkException({required this.message});

  @override
  String toString() => 'NetworkException: $message';
}

class ValidationException implements Exception {
  final String message;

  const ValidationException({required this.message});

  @override
  String toString() => 'ValidationException: $message';
}

class AuthenticationException implements Exception {
  final String message;

  const AuthenticationException({required this.message});

  @override
  String toString() => 'AuthenticationException: $message';
}

class AuthorizationException implements Exception {
  final String message;

  const AuthorizationException({required this.message});

  @override
  String toString() => 'AuthorizationException: $message';
}

class UnexpectedException implements Exception {
  final String message;

  const UnexpectedException({required this.message});

  @override
  String toString() => 'UnexpectedException: $message';
}
