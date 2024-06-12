import 'package:greengrocer/src/services/http_manager.dart';

import 'package:greengrocer/src/constants/endpoints.dart';

class HomeRepository {
  Future getAllCategories() async {
    final response = await httpManager.request(
      url: Endpoints.getCategories,
      method: HttpMethods.post,
    );

    if (response['result'] != null) {
      print(response['result']);
    } else {
      print(response['error']);
    }
  }
}
