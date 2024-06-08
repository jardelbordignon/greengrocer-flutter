import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/screens/auth/repository/auth_errors.dart';
import 'package:greengrocer/src/screens/auth/response/auth_response.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  Future<AuthResponse> signIn(String email, String password) async {
    final response = await httpManager.request(
      url: Endpoints.signIn,
      method: HttpMethods.post,
      body: {'email': email, 'password': password},
    );

    if (response['result'] != null) {
      final user = UserModel.fromJson(response['result']);
      return AuthResponse.success(user);
    } else {
      final error = authErrors(response['error']);
      return AuthResponse.error(error);
    }
  }
}
