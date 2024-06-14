import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/screens/home/repository/home_repository.dart';
import 'package:greengrocer/src/screens/home/response/home_response.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();

  bool isLoading = true;
  List<CategoryModel> categories = [];
  CategoryModel? selectedCategory;

  void setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void selectCategory(CategoryModel? category) {
    selectedCategory = category;
    update();
  }

  Future<void> getCategories() async {
    HomeResponse<CategoryModel> response = await homeRepository.getCategories();

    response.when(
      success: (data) {
        categories.assignAll(data);
        //print('HomeController.getCategories: $categories');
        if (categories.isNotEmpty) {
          selectCategory(categories.first);
        }
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          type: ToastType.error,
        );
      },
    );
  }

  Future<void> getProducts() async {
    HomeResponse<ItemModel> response = await homeRepository.getProducts({
      'categoryId': selectedCategory?.id,
      'title': null,
      'page': 0,
      'itemsPerPage': 6
    });

    response.when(
      success: (data) {
        print('HomeController.getProducts: $data');
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
  void onInit() async {
    super.onInit();
    await getCategories();
    await getProducts();
    setIsLoading(false);
  }
}
