import 'package:get/get.dart';
import 'package:greengrocer/src/screens/auth/sign_in_screen.dart';
import 'package:greengrocer/src/screens/auth/sign_up_screen.dart';
import 'package:greengrocer/src/screens/base/base_screen.dart';
import 'package:greengrocer/src/screens/splash/splash_screen.dart';

abstract class Pages {
  static final list = <GetPage>[
    GetPage(name: Routes.signIn, page: () => SignInScreen()),
    GetPage(name: Routes.signUp, page: () => SignUpScreen()),
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.base, page: () => const BaseScreen()),
  ];
}

abstract class Routes {
  static const String base = '/';
  static const String splash = '/splash';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
}
