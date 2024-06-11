import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/screens/auth/repository/auth_errors.dart';
import 'package:greengrocer/src/screens/auth/response/auth_response.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  Future<AuthResponse> signUp(UserModel user) async {
    final response = await httpManager.request(
      url: Endpoints.signUp,
      method: HttpMethods.post,
      body: user.toJson(),
    );
    return _handleHttpResponse(response);
  }

  Future<AuthResponse> signIn(String email, String password) async {
    final response = await httpManager.request(
      url: Endpoints.signIn,
      method: HttpMethods.post,
      body: {'email': email, 'password': password},
    );

    return _handleHttpResponse(response);
  }

  Future<void> resetPassword(String email) async {
    await httpManager.request(
      url: Endpoints.resetPassword,
      method: HttpMethods.post,
      body: {'email': email},
    );
  }

  Future<AuthResponse> validateToken(String token) async {
    final response = await httpManager.request(
      url: Endpoints.validateToken,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
    );

    return _handleHttpResponse(response);
  }

  AuthResponse _handleHttpResponse(Map<dynamic, dynamic> response) {
    if (response['result'] != null) {
      final user = UserModel.fromJson(response['result']);
      return AuthResponse.success(user);
    } else {
      final error = authErrors(response['error']);
      return AuthResponse.error(error);
    }
  }
}
