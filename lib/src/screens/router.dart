import 'package:get/get.dart';
import 'package:greengrocer/src/screens/auth/view/sign_in_screen.dart';
import 'package:greengrocer/src/screens/auth/view/sign_up_screen.dart';
import 'package:greengrocer/src/screens/base/base_screen.dart';
import 'package:greengrocer/src/screens/base/binding/navigation_binding.dart';
import 'package:greengrocer/src/screens/cart/binding/cart_binding.dart';
import 'package:greengrocer/src/screens/home/binding/home_binding.dart';
import 'package:greengrocer/src/screens/product/product_screen.dart';
import 'package:greengrocer/src/screens/splash/splash_screen.dart';

abstract class Pages {
  static final list = <GetPage>[
    GetPage(
      name: Routes.base,
      page: () => const BaseScreen(),
      bindings: [
        // Bindings will injected into respective controllers when BaseScreen is loaded
        NavigationBinding(),
        HomeBinding(),
        CartBinding(),
      ],
    ),
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.signIn, page: () => SignInScreen()),
    GetPage(name: Routes.signUp, page: () => SignUpScreen()),
    GetPage(name: Routes.product, page: () => ProductScreen()),
  ];
}

abstract class Routes {
  static const String base = '/';
  static const String splash = '/splash';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String product = '/product';
}
