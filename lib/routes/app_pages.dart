import 'package:get/get.dart';

import 'package:hcmue/public/login/login_screen.dart';
import 'package:hcmue/public/splash/splash_screen.dart';

class AppPages {
  AppPages._();

  static const initial = '/login';
  static const splashScreen = '/splash';

  static final routes = [
    GetPage(
      name: initial,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
    ),
  ];
}
