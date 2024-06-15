import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/screens/cart/response/cart_response.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class CartRepository {
  Future<CartResponse<List<CartItemModel>>> getCartItems({
    required String token,
    required String userId,
  }) async {
    final response = await httpManager.request(
      url: Endpoints.getCartItems,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {'user': userId},
    );

    if (response['result'] != null) {
      List<Map<String, dynamic>> result = List.from(response['result']);
      List<CartItemModel> data = result.map(CartItemModel.fromJson).toList();
      return CartResponse<List<CartItemModel>>.success(data);
    } else {
      return CartResponse.error(response['error']);
    }
  }
}
