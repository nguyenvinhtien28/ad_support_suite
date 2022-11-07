import 'dart:ui';

import 'package:get/get.dart';

class OptionController extends GetxController {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  bool showAvg = false;
  final isCheck = false.obs;
  @override
  void onInit() {
    super.onInit();
    onInitData();
  }

  Future<void> onInitData() async {
    isCheck.value = Get.arguments;
  }
}
