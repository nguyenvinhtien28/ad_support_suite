import 'package:ad_support_suite/features/login_facebook/controllers/login_facebook_controller.dart';
import 'package:get/get.dart';

class LoginFacebookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginFacebookController>(
      () => LoginFacebookController(),
    );
  }
}
