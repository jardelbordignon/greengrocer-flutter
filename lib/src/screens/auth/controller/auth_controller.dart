import 'package:get/get.dart';
import 'package:greengrocer/src/constants/storage_keys.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/screens/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/screens/auth/response/auth_response.dart';
import 'package:greengrocer/src/screens/router.dart';
import 'package:greengrocer/src/services/local_storage.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();

  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();
    //await localStorage.deleteAll();
    validateToken();
  }

  Future<void> saveTokenAndProceedToBase() async {
    await localStorage.set(StorageKeys.token, user.token!,
        ttlMinutes: 60 * 24 * 10);
    Get.offAllNamed(Routes.base);
  }

  Future<void> signUp() async {
    isLoading.value = true;
    AuthResponse response = await authRepository.signUp(user);
    isLoading.value = false;

    response.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          type: ToastType.error,
        );
      },
    );
  }

  Future<void> signIn(String email, String password) async {
    isLoading.value = true;
    AuthResponse response = await authRepository.signIn(email, password);
    isLoading.value = false;

    response.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          type: ToastType.error,
        );
        Get.offAllNamed(Routes.signIn);
      },
    );
  }

  Future<void> signOut() async {
    // clear user
    user = UserModel();
    // remove token
    await localStorage.delete(StorageKeys.token);
    // redirect to sign in
    Get.offAllNamed(Routes.signIn);
  }

  Future<void> validateToken() async {
    String? token = await localStorage.get(StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(Routes.signIn);
      return;
    }

    AuthResponse response = await authRepository.validateToken(token);
    response.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {
        signOut();
      },
    );
  }
}
