import 'package:ad_support_suite/route/app_pages.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/utils/app_utils.dart';
import 'firebase_options.dart';
import 'network/services/user_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAnalytics.instance
      .setDefaultEventParameters({});

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
  await configApp();
  runApp(
    AppResponsive(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        // defaultTransition: Transition.downToUp,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}

Future<void> configApp() async {
  // WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Colors.black));
  // await GetStorage.init();
  // await Firebase.initializeApp();

  // await dotenv.load(fileName: '.env');
  Get.put(UserService());
}
