import 'package:get/get.dart';

import '../../../network/services/db_services.dart';

class HomeController extends GetxController {
  final name = "Page";
  final isComment = true.obs;
  final isMes = false.obs;
  final isTask = false.obs;
  final isCheckPass = false.obs;
  final dbService = DBService();

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  Future<void> initData() async {
    isCheckPass.value = await dbService.checkPassIos();
  }
}
