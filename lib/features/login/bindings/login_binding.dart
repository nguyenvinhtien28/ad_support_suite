import 'package:ad_support_suite/features/login/controllers/login_controller.dart';
import 'package:get/get.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }

}