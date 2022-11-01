import 'package:ad_support_suite/features/login/view/login_view.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../network/services/db_services.dart';
import '../../../route/app_pages.dart';
import '../../home/view/home_view.dart';

class SplashController extends GetxController {
  String? action;
  final dbService = DBService();
  final isCheckPass = false.obs;
  static final facebookAppEvents = FacebookAppEvents();

  @override
  void onInit() {
    super.onInit();
    checkRejectApp();
  }

  Future<void> checkRejectApp() async {
    isCheckPass.value = await dbService.checkPass();
    final prefs = await SharedPreferences.getInstance();
    action = prefs.getString('accountId');
    facebookAppEvents.logEvent(name: "sentFriendRequest");
  }

  Future<void> checkingLogin(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isCheckPass.value == true) {
          if (action == null) {
            Get.offAndToNamed(Routes.LOGIN);
            // Navigator.push(
            //   context,
            //   PageTransition(
            //       type: PageTransitionType.fade,
            //       child: const LoginView(),
            //       duration: const Duration(milliseconds: 300)),
            // );
          }
        } else {
          Get.offAndToNamed(Routes.HOME);
          // Navigator.push(
          //   context,
          //   PageTransition(
          //       type: PageTransitionType.fade,
          //       child: const HomeView(),
          //       duration: const Duration(milliseconds: 300)),
          // );
        }
      },
    );
  }
}
