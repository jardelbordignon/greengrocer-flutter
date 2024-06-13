import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/screens/home/response/home_response.dart';
import 'package:greengrocer/src/services/http_manager.dart';

import 'package:greengrocer/src/constants/endpoints.dart';

class HomeRepository {
  Future<HomeResponse<CategoryModel>> getCategories() async {
    final response = await httpManager.request(
      url: Endpoints.getCategories,
      method: HttpMethods.post,
    );

    if (response['result'] != null) {
      //print('\n\nresult:\n${response['result']}');
      List<Map<String, dynamic>> result = List.from(response['result']);
      //print('\n\nresult to lint map:\n$result');
      List<CategoryModel> data = result.map(CategoryModel.fromJson).toList();
      //print('\n\nresult to lint model:\n$data');

      return HomeResponse<CategoryModel>.success(data);
    } else {
      return HomeResponse.error(response['error'] ??
          'An unexpected error ocurred on load categories');
    }
  }
}
