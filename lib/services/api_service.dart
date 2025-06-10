import '../config/app_config.dart';

class ApiService {
  static ApiService? _instance;

  static ApiService get instance {
    _instance ??= ApiService._();
    return _instance!;
  }

  ApiService._();

  String get baseUrl => AppConfig.currentBaseUrl;

  // Example API endpoints
  String get authEndpoint => '$baseUrl/auth';
  String get userEndpoint => '$baseUrl/user';
  String get dataEndpoint => '$baseUrl/data';

  // Example method to demonstrate usage
  Future<void> authenticate(String username, String password) async {
    final url = authEndpoint;
    print('Authenticating at: $url');
    // Add your HTTP client logic here
    // For example: using http package or dio
  }

  Future<Map<String, dynamic>?> getUserData(String userId) async {
    final url = '$userEndpoint/$userId';
    print('Fetching user data from: $url');
    // Add your HTTP client logic here
    return null;
  }

  Future<List<dynamic>?> fetchData() async {
    final url = dataEndpoint;
    print('Fetching data from: $url');
    // Add your HTTP client logic here
    return null;
  }
}
