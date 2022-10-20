import 'package:get/get.dart';

import '../controllers/option_controller.dart';

class OptionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionController>(
          () => OptionController(),
    );
  }

}