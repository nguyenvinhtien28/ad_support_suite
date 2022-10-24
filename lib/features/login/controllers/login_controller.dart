import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../const/resource.dart';

class LoginController extends GetxController {
  final listPage = [
    {
      'image': R.ASSETS_PNG_AUTOMATION_PNG,
      'title': "✓ Automation Tactics ",
      'content': "✓ Automation Tactics \n"
          "✓ Autonomous Budget Optimizer \n"
          "✓ Custom Automation\n"
          "✓ Facebook Ad Automation Software "
    }
  ];
  final pageIndex = 0.obs;
  final controllers = PageController(viewportFraction: 0.9, initialPage: 0);

}
