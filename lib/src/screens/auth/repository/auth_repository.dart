import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  Future signIn({required String email, required String password}) async {
    httpManager.request(
      url: Endpoints.signIn,
      method: HttpMethods.post,
      body: {'email': email, 'password': password},
      onError: (error) {
        print(error);
      },
      onSuccess: (data) {
        final user = UserModel.fromJson(data['result']);
        print(user);
      },
    );
  }
}
