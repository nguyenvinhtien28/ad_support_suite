import 'package:ad_support_suite/features/login_facebook/controllers/login_facebook_controller.dart';
import 'package:ad_support_suite/theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/resource.dart';
import '../../../core/const/constans.dart';
import '../../../core/utils/app_utils.dart';
import '../../login/components/privacy_policy.dart';
import '../../login/components/terms_and_conditions.dart';
import '../components/webview_bottom_sheet.dart';

class LoginFacebookView extends GetView<LoginFacebookController> {
  const LoginFacebookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: skyBlue[200]),
                    width: Responsive.isMobile ? 40.w : 20.w,
                    child: Image.asset(
                      R.ASSETS_PNG_LOGO_PNG,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: Responsive.isMobile ? 48 : 50,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: colorWhite),
                      width: Responsive.isMobile ? 35 : 50,
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        R.ASSETS_PNG_INSTAGRAM_CR_PNG,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom:Responsive.isMobile ? 20 : 10,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: colorWhite),
                      width: Responsive.isMobile ? 35 : 50,
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        R.ASSETS_PNG_FACEBOOK_CR_PNG,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultWidePadding,
              ),
              child: Align(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By click the button above, you agree to our ',
                    style: typoRegular16.copyWith(color: colorText80),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms and Conditions ',
                        style: typoBold16.copyWith(color: colorBLue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => showModalBottomSheet<void>(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return const TermsAndConditions();
                                },
                              ),
                      ),
                      const TextSpan(
                        text: 'and confirm that you have read our ',
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: typoBold16.copyWith(color: colorBLue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => showModalBottomSheet<void>(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return const PrivacyPolicy();
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            GestureDetector(
              onTap: () {
                showWebVew(
                  context,
                  loginFacebookController: controller,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultThinPadding),
                margin: const EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDefaultExThinPadding),
                  color: colorBLue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(R.ASSETS_PNG_FACEBOOK_WHITE_PNG),
                    ),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Login with Facebook',
                        style: typoBold16.copyWith(color: colorWhite),
                        children: const <TextSpan>[
                          // TextSpan(
                          //   text: 'Continue with Facebook',
                          //   style: typoRegular14,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
