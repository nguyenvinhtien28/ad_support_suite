import 'package:ad_support_suite/features/login_facebook/bindings/login_facabook_binding.dart';
import 'package:ad_support_suite/features/login_facebook/view/login_facebook_view.dart';
import 'package:ad_support_suite/features/splash/bindings/splash_binding.dart';
import 'package:ad_support_suite/features/splash/view/splash_view.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../features/home/bindings/home_bindings.dart';
import '../features/home/view/home_view.dart';
import '../features/login/bindings/login_binding.dart';
import '../features/login/view/login_view.dart';
import '../features/option/bindings/option_binding.dart';
import '../features/option/view/option_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),GetPage(
      name: _Paths.LOGIN_FACEBOOK,
      page: () => const LoginFacebookView(),
      binding: LoginFacebookBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.OPTION,
      page: () => const OptionView(),
      binding: OptionBindings(),
    ),
  ];
}
