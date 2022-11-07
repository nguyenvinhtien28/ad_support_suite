import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../network/services/db_services.dart';
import '../../../route/app_pages.dart';

class SplashController extends GetxController {
  String? action;
  final dbService = DBService();
  final isCheckPass = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkRejectApp();
  }
  Future<void> initPlugin() async {
    final TrackingStatus status =
    await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
    await AppTrackingTransparency.getAdvertisingIdentifier();
  }

  Future<void> checkRejectApp() async {
    isCheckPass.value = await dbService.checkPass();
    final prefs = await SharedPreferences.getInstance();
    action = prefs.getString('accountId');
  }

  Future<void> checkingLogin(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isCheckPass.value == true) {
          if (action == null) {
            Get.offAllNamed(Routes.LOGIN);
            initPlugin();
            // Navigator.push(
            //   context,
            //   PageTransition(
            //       type: PageTransitionType.fade,
            //       child: const LoginView(),
            //       duration: const Duration(milliseconds: 300)),
            // );
          }
        } else {
          Get.offAllNamed(Routes.HOME);
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
