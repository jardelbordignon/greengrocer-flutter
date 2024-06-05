import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;

    if (password == 'Pwd@123!') {
      return true;
    }

    return false;
  }
}
