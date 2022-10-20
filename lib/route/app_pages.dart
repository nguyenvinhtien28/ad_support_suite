
import 'package:get/get.dart';

import '../features/home/bindings/home_bindings.dart';
import '../features/home/view/home_view.dart';
import '../features/login/bindings/login_binding.dart';
import '../features/login/view/login_view.dart';
import '../features/option/bindings/option_binding.dart';
import '../features/option/view/option_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
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
