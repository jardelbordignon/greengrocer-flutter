import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class CartRepository {
  Future getCartItems({
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
      print(response['result']);
    } else {
      print(response['error']);
    }
  }
}
