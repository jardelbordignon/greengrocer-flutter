import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/screens/home/response/home_response.dart';
import 'package:greengrocer/src/services/http_manager.dart';

import 'package:greengrocer/src/constants/endpoints.dart';

class HomeRepository {
  Future<HomeResponse> getAllCategories() async {
    final response = await httpManager.request(
      url: Endpoints.getCategories,
      method: HttpMethods.post,
    );

    if (response['result'] != null) {
      List<Map<String, dynamic>> result = response['result'];
      List<CategoryModel> data = result.map(CategoryModel.fromJson).toList();

      return HomeResponse<CategoryModel>.success(data);
    } else {
      return HomeResponse.error(response['error'] ??
          'An unexpected error ocurred on load categories');
    }
  }
}
