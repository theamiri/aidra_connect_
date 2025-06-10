import 'api_client.dart';
import 'api_endpoints.dart';
import '../error/exceptions.dart';

class ApiServiceExample {
  final ApiClient _apiClient;

  ApiServiceExample(this._apiClient);

  // Example: Login user
  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );

      // Set auth token if login successful
      if (response['token'] != null) {
        _apiClient.setAuthToken(response['token']);
      }

      return response;
    } on AuthenticationException {
      rethrow;
    } on NetworkException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnexpectedException(message: 'Login failed: ${e.toString()}');
    }
  }

  // Example: Get user list
  Future<List<dynamic>> getUsers({Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _apiClient.get(
        ApiEndpoints.users,
        queryParameters: queryParams,
      );

      // API returns either JSON or List<JSON>
      if (response is List) {
        return response;
      } else if (response is Map && response['data'] is List) {
        return response['data'];
      } else {
        return [response];
      }
    } on ServerException {
      rethrow;
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw UnexpectedException(
        message: 'Failed to get users: ${e.toString()}',
      );
    }
  }

  // Example: Create new post
  Future<Map<String, dynamic>> createPost({
    required String title,
    required String content,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.posts,
        data: {'title': title, 'content': content},
      );

      return response;
    } on ValidationException {
      rethrow;
    } on AuthorizationException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnexpectedException(
        message: 'Failed to create post: ${e.toString()}',
      );
    }
  }

  // Example: Update user profile
  Future<Map<String, dynamic>> updateUserProfile(
    String userId, {
    required Map<String, dynamic> profileData,
  }) async {
    try {
      final response = await _apiClient.put(
        ApiEndpoints.userById(userId),
        data: profileData,
      );

      return response;
    } on ValidationException {
      rethrow;
    } on AuthorizationException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnexpectedException(
        message: 'Failed to update profile: ${e.toString()}',
      );
    }
  }

  // Example: Delete post
  Future<void> deletePost(String postId) async {
    try {
      await _apiClient.delete(ApiEndpoints.postById(postId));
    } on AuthorizationException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnexpectedException(
        message: 'Failed to delete post: ${e.toString()}',
      );
    }
  }

  // Logout and clear token
  Future<void> logout() async {
    try {
      await _apiClient.post(ApiEndpoints.logout);
      _apiClient.clearAuthToken();
    } catch (e) {
      // Always clear token even if logout fails
      _apiClient.clearAuthToken();
      throw UnexpectedException(message: 'Logout failed: ${e.toString()}');
    }
  }
}
