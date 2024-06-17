import 'package:get/get.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
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

  double cartTotalPrice() {
    double total = 0;
    for (final item in cartItems) {
      total += item.totalPrice();
    }
    return total;
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
        //print('Cart items: $cartItems');
      },
      error: (message) {
        utilsServices.showToast(message: message, type: ToastType.error);
      },
    );
  }

  int getCartItemIndex(ItemModel item) =>
      cartItems.indexWhere((cartItem) => cartItem.item.id == item.id);

  Future<void> addItemToCart({required ItemModel item, int quantity = 1}) async {
    int cartItemIndex = getCartItemIndex(item);
    if (cartItemIndex >= 0) {
      cartItems[cartItemIndex].quantity += quantity;
    } else {
      cartItems.add(
        CartItemModel(
          id: '',
          item: item,
          quantity: quantity,
        ),
      );
    }
  }
}
