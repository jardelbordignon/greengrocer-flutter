import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/screens/home/repository/home_repository.dart';
import 'package:greengrocer/src/screens/home/response/home_response.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();

  bool isLoading = false;

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  List<CategoryModel> categories = [];

  Future<void> getCategories() async {
    setIsLoading(true);

    HomeResponse<CategoryModel> response = await homeRepository.getCategories();

    setIsLoading(false);

    response.when(
      success: (data) {
        categories.assignAll(data);
        print('HomeController.getCategories: $categories');
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          type: ToastType.error,
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }
}
