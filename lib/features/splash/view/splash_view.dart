import 'package:ad_support_suite/features/splash/controllers/splash_controller.dart';
import 'package:ad_support_suite/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/resource.dart';
import '../../../core/utils/app_utils.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>().checkingLogin(context);
    return Scaffold(backgroundColor: colorWhite ,
      body: Center(
        child: SizedBox(
          width: Responsive.isMobile ? 40.w  : 20.w,
          child: Image.asset(
           R.ASSETS_PNG_LOGOJPG_JPG,
          ),
        ),
      ),
    );
  }
}
