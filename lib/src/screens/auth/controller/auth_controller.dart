import 'package:get/get.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/screens/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/screens/auth/response/auth_response.dart';
import 'package:greengrocer/src/screens/router.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();

  UserModel user = UserModel();

  Future<void> signIn(String email, String password) async {
    isLoading.value = true;

    AuthResponse response = await authRepository.signIn(email, password);

    isLoading.value = false;

    response.when(
      success: (user) {
        this.user = user;
        Get.offAllNamed(Routes.base);
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          type: ToastType.error,
        );
      },
    );
  }
}
