import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/resource.dart';
import '../../../core/const/constans.dart';
import '../../../route/app_pages.dart';
import '../../../theme/app_theme.dart';
import '../components/privacy_policy.dart';
import '../components/terms_and_conditions.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Image.asset(
              R.ASSETS_PNG_LOGO_JPG,
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(kDefaultPadding),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Connect your Facebook ',
                  style: typoRegular20.copyWith(color: colorText80),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Business Manager account',
                      style: typoBold20.copyWith(color: colorText100),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.HOME);
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
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(R.ASSETS_PNG_FACEBOOK_WHITE_PNG),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Continue with ',
                      style: typoRegular16.copyWith(color: colorWhite),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Facebook',
                          style: typoBold16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultWidePadding, vertical: kDefaultFatPadding),
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
        ],
      ),
    );
  }
}
