import 'package:get/get.dart';
import 'package:greengrocer/src/screens/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    await authRepository.signIn(email: email, password: password);
    isLoading.value = false;

    if (password == 'Pwd@123!') {
      return true;
    }

    return false;
  }
}
