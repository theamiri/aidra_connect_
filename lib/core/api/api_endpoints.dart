class ApiEndpoints {
  // Base path aliases
  static const String _authPath = 'authentications';
  static const String _collectionsPath = 'collections';

  // Authentication endpoints
  static String get login => '$_authPath/login';
  static String get register => '$_authPath/register';
  static String get logout => '$_authPath/logout';
  static String get refreshToken => '$_authPath/refresh';
  static String get forgotPassword => '$_authPath/forgot-password';
  static String get resetPassword => '$_authPath/reset-password';
  static String get verifyEmail => '$_authPath/verify-email';
  static String get resendVerification => '$_authPath/resend-verification';

  // Collection endpoints - examples (you can modify based on your needs)
  static String get users => '$_collectionsPath/users';
  static String get profiles => '$_collectionsPath/profiles';
  static String get posts => '$_collectionsPath/posts';
  static String get categories => '$_collectionsPath/categories';

  // Helper methods for dynamic endpoints
  static String userById(String id) => '$_collectionsPath/users/$id';
  static String postById(String id) => '$_collectionsPath/posts/$id';
  static String categoryById(String id) => '$_collectionsPath/categories/$id';

  // Custom endpoint builders
  static String authEndpoint(String path) => '$_authPath/$path';
  static String collectionsEndpoint(String path) => '$_collectionsPath/$path';
}
