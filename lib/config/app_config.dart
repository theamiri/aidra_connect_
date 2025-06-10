enum Environment { dev, test }

class AppConfig {
  static late Environment _environment;
  static late AppConfig _instance;

  final String baseUrl;
  final String appName;
  final bool debugMode;

  AppConfig._({
    required this.baseUrl,
    required this.appName,
    required this.debugMode,
  });

  static AppConfig get instance => _instance;

  static void setEnvironment(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.dev:
        _instance = AppConfig._(
          baseUrl: 'https://dev-api.aidra.tech',
          appName: 'Aidra Connect - Dev',
          debugMode: true,
        );
        break;
      case Environment.test:
        _instance = AppConfig._(
          baseUrl: 'https://test-api.aidra.tech',
          appName: 'Aidra Connect - Test',
          debugMode: false,
        );
        break;
    }
  }

  static Environment get environment => _environment;
  static String get currentBaseUrl => _instance.baseUrl;
  static String get currentAppName => _instance.appName;
  static bool get isDebugMode => _instance.debugMode;
}
