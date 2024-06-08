import 'package:get/get.dart';
import 'package:greengrocer/src/screens/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/screens/auth/response/auth_response.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();

  Future<bool> signIn(String email, String password) async {
    isLoading.value = true;

    AuthResponse response = await authRepository.signIn(email, password);

    isLoading.value = false;

    return response.when(
      success: (user) {
        print(user);
        return true;
      },
      error: (message) {
        print(message);
        return false;
      },
    );
  }
}
