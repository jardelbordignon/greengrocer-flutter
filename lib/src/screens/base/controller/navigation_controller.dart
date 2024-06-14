import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class NavigationTabs {
  static const int home = 0;
  static const int cart = 1;
  static const int orders = 2;
  static const int profile = 3;
}

class NavigationController extends GetxController {
  late PageController _pageController;
  late RxInt _currentIndex;

  @override
  void onInit() {
    super.onInit();

    initNavigation(
      pageController: PageController(initialPage: NavigationTabs.home),
      currentIndex: NavigationTabs.home,
    );
  }

  void initNavigation({
    required PageController pageController,
    required int currentIndex,
  }) {
    _pageController = PageController();
    _currentIndex = currentIndex.obs;
  }

  void navigateToPage(int index) {
    if (_currentIndex.value == index) return;

    _currentIndex.value = index;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
