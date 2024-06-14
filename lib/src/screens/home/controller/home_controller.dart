import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/screens/home/repository/home_repository.dart';
import 'package:greengrocer/src/screens/home/response/home_response.dart';
import 'package:greengrocer/src/services/utils_services.dart';

const int itemsPerPage = 6;

class HomeController extends GetxController {
  final homeRepository = HomeRepository();

  bool isLoadingCategories = true;
  bool isLoadingProducts = true;
  List<CategoryModel> categories = [];
  CategoryModel? selectedCategory;
  List<ItemModel> get categoryProducts => selectedCategory?.items ?? [];
  bool get isLastPage {
    if (categoryProducts.length < itemsPerPage) return true;
    return selectedCategory!.currentPage * itemsPerPage >
        categoryProducts.length;
  }

  void setIsLoading(bool value, {bool isProducts = false}) {
    isProducts ? isLoadingProducts = value : isLoadingCategories = value;
    update();
  }

  void selectCategory(CategoryModel? category) {
    selectedCategory = category;
    update();

    if (selectedCategory!.items.isEmpty) {
      getProducts();
    }
  }

  Future<void> getCategories() async {
    HomeResponse<CategoryModel> response = await homeRepository.getCategories();
    setIsLoading(false);

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

  Future<void> getProducts({bool showLoader = true}) async {
    Map<String, dynamic> body = {
      'categoryId': selectedCategory!.id,
      'itemsPerPage': itemsPerPage,
      'page': selectedCategory!.currentPage,
    };

    if (showLoader) setIsLoading(true, isProducts: true);
    HomeResponse<ItemModel> response = await homeRepository.getProducts(body);
    setIsLoading(false, isProducts: true);

    response.when(
      success: (data) {
        //print('loaded products: $data');
        selectedCategory!.items.addAll(data);
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          type: ToastType.error,
        );
      },
    );
  }

  void getNextProducts() {
    selectedCategory!.currentPage++;
    getProducts(showLoader: false);
  }

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }
}
