import 'package:get/get.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/screens/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/screens/cart/repository/cart_repository.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  final authController = Get.find<AuthController>();

  List<CartItemModel> cartItems = [];

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  Future<void> getCartItems() async {
    final response = await cartRepository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );

    response.when(
      success: (data) {
        cartItems = data;
        update();
        print('Cart items: $cartItems');
      },
      error: (message) {
        utilsServices.showToast(message: message, type: ToastType.error);
      },
    );
  }
}
