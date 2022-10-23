import 'package:ad_support_suite/features/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  String? action;

  Future<void> checkingLogin(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    action = prefs.getString('accountId');
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // if (action == null) {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: const LoginView(),
                  duration: const Duration(milliseconds: 300)));
        //
        //   // Get.offAndToNamed(Routes.LOGIN);
        // } else {
        //   Navigator.push(
        //       context,
        //       PageTransition(
        //           type: PageTransitionType.fade,
        //           child: const HomeView(),
        //           duration: const Duration(milliseconds: 300)));
      // }
      //   Navigator.push(
      //     context,
      //     PageTransition(
      //         type: PageTransitionType.fade,
      //         child: const HomeView(),
      //         duration: const Duration(milliseconds: 300)));
          // Get.offAndToNamed(Routes.HOME);
      },
    );
  }
}
