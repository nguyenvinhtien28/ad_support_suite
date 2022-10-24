import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../const/resource.dart';
import '../../../core/const/constans.dart';
import '../../../core/utils/app_utils.dart';
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
      body: CupertinoScaffold(
        body: Builder(builder: (context) {
          return CupertinoPageScaffold(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   width: Responsive.isMobile ? 40.w  : 20.w,
                  //   child: Image.asset(
                  //     R.ASSETS_PNG_LOGO_JPG,
                  //   ),
                  // ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(kDefaultPadding),
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: '✓ About Ad Support Suite \n \n',
                          style: typoBold20.copyWith(color: colorText100),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "This is a free tool to manage your business on both Facebook and Instagram in one place. You can take advantage of features to save time and grow your business. \nLet's see what makes this tool different. ",
                              style: typoLight14.copyWith(color: colorText80),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(child: SizedBox()),
                            Container(
                              width: 37,
                              height: 37,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: skyBlue[200]),
                              child: Image.asset(
                                R.ASSETS_PNG_LOGO_PNG,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              width: kDefaultThinPadding,
                            ),
                            Image.asset(
                              R.ASSETS_PNG_FACEBOOK_PNG,
                              width: 35,
                              height: 35,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              width: kDefaultThinPadding,
                            ),
                            Image.asset(
                              R.ASSETS_PNG_INSTAGRAM_PNG,
                              width: 36,
                              height: 36,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                        const Divider(),
                        const ShowTextInfo(
                          title:
                              "Manage all messages and comments in one inbox",
                          image1: true,
                        ),
                        const Divider(),
                        const ShowTextInfo(
                          title:
                              "Share custom posts on both Facebook and Instagram",
                          image1: true,
                        ),
                        const Divider(),
                        const ShowTextInfo(
                          title:
                              "Manage everything related to business accounts on Meta",
                          image1: true,
                        ),
                        const Divider(),
                        const ShowTextInfo(
                          title: "Schedule ads",
                          image1: true,
                          image2: true,
                        ),
                        const Divider(),
                        const ShowTextInfo(
                          title: "Create ads",
                          image1: true,
                          image2: true,
                          image3: true,
                        ),
                        const Divider(),
                        const ShowTextInfo(
                          title: "Compare details",
                          image1: true,
                          image2: true,
                          image3: true,
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: kDefaultWidePadding,
                  //       vertical: kDefaultFatPadding),
                  //   child: Align(
                  //     child: RichText(
                  //       textAlign: TextAlign.center,
                  //       text: TextSpan(
                  //         text: 'By click the button above, you agree to our ',
                  //         style: typoRegular16.copyWith(color: colorText80),
                  //         children: <TextSpan>[
                  //           TextSpan(
                  //             text: 'Terms and Conditions ',
                  //             style: typoBold16.copyWith(color: colorBLue),
                  //             recognizer: TapGestureRecognizer()
                  //               ..onTap = () => showModalBottomSheet<void>(
                  //                     shape: RoundedRectangleBorder(
                  //                       borderRadius: BorderRadius.circular(12),
                  //                     ),
                  //                     context: context,
                  //                     isScrollControlled: true,
                  //                     builder: (BuildContext context) {
                  //                       return const TermsAndConditions();
                  //                     },
                  //                   ),
                  //           ),
                  //           const TextSpan(
                  //             text: 'and confirm that you have read our ',
                  //           ),
                  //           TextSpan(
                  //             text: 'Privacy Policy',
                  //             style: typoBold16.copyWith(color: colorBLue),
                  //             recognizer: TapGestureRecognizer()
                  //               ..onTap = () => showModalBottomSheet<void>(
                  //                     shape: RoundedRectangleBorder(
                  //                       borderRadius: BorderRadius.circular(12),
                  //                     ),
                  //                     context: context,
                  //                     isScrollControlled: true,
                  //                     builder: (BuildContext context) {
                  //                       return const PrivacyPolicy();
                  //                     },
                  //                   ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "See what's included",
                        style: typoBold14.copyWith(color: colorBLue),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          CupertinoScaffold.showCupertinoModalBottomSheet(
                            expand: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => Scaffold(
                              backgroundColor: colorWhite,
                              body: Column(
                                children: [
                                  SizedBox(
                                    height: 60.h,
                                    child: PageView(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(kDefaultPadding),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Image.asset(
                                                  R.ASSETS_PNG_AD_PERR_PNG,
                                                  height: 80.w,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Text('✓ Automation', style: typoBold22.copyWith(
                                                  color: colorBLue),),
                                              const SizedBox(height: kDefaultExThinPadding,),
                                              Text("✓ Automation Tactics \n"
                                                  "✓ Autonomous Budget Optimizer \n"
                                                  "✓ Custom Automation\n"
                                                  "✓ Facebook Ad Automation Software ",style:
                                              typoLight16.copyWith(
                                                  color:
                                                  colorText80),)
                                              // RichText(
                                              //   textAlign: TextAlign.left,
                                              //   text: TextSpan(
                                              //     text: '✓ Automation \n',
                                              //     style: typoBold20.copyWith(
                                              //         color: colorText100),
                                              //     children: <TextSpan>[
                                              //       TextSpan(
                                              //         text:
                                              //             "✓ Automation Tactics \n"
                                              //             "✓ Autonomous Budget Optimizer \n"
                                              //             "✓ Custom Automation\n"
                                              //             "✓ Facebook Ad Automation Software ",
                                              //         style:
                                              //             typoLight14.copyWith(
                                              //                 color:
                                              //                     colorText80),
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              R.ASSETS_PNG_AUTOMATION_PNG,
                                              height: 80.w,
                                              fit: BoxFit.fill,
                                            ),
                                            Text("data")
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              R.ASSETS_PNG_CREATIVE_PNG,
                                              height: 80.w,
                                              fit: BoxFit.fill,
                                            ),
                                            Text("data")
                                          ],
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                R.ASSETS_PNG_TARRGETING_PNG,
                                                height: 80.w,
                                                fit: BoxFit.fill,
                                              ),
                                              Text("data")
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text("Skip",style: typoBold16.copyWith(color: colorBLue),)
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultThinPadding,
                              vertical: kDefaultExThinPadding),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kDefaultExThinPadding),
                              color: colorBLue),
                          child: Text(
                            "With AI",
                            style: typoBold14.copyWith(color: colorWhite),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: kDefaultThinPadding,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: colorBLue,
                          margin: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                        ),
                      ),
                      Text(
                        "OR",
                        style: typoBold12.copyWith(color: colorBLue),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: colorBLue,
                          margin: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.HOME);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                          vertical: kDefaultThinPadding),
                      margin: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(kDefaultExThinPadding),
                        color: colorBLue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   width: 24,
                          //   height: 24,
                          //   child: Image.asset(R.ASSETS_PNG_FACEBOOK_WHITE_PNG),
                          // ),
                          // const SizedBox(
                          //   width: kDefaultPadding,
                          // ),
                          RichText(
                            text: TextSpan(
                              text: 'Start for Free',
                              style: typoBold18.copyWith(color: colorWhite),
                              children: <TextSpan>[
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
        }),
      ),
    );
  }
}

class ShowTextInfo extends StatelessWidget {
  const ShowTextInfo({
    Key? key,
    required this.title,
    this.image1 = true,
    this.image2 = false,
    this.image3 = false,
  }) : super(key: key);

  final String title;
  final bool image1;
  final bool image2;
  final bool image3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Text(
            title,
            style: typoRegular14.copyWith(color: colorBlack),
          ),
        ),
        Expanded(
            flex: 1,
            child: Text(
              "✓",
              style: typoBold18.copyWith(color: colorBLue),
              textAlign: TextAlign.center,
            )),
        Expanded(
          flex: 1,
          child: image2
              ? Text(
                  "✓",
                  style: typoBold18.copyWith(color: colorGreen),
                  textAlign: TextAlign.center,
                )
              : const SizedBox(),
        ),
        Expanded(
          flex: 1,
          child: image3
              ? Text(
                  "✓",
                  style: typoBold18.copyWith(color: colorGreen),
                  textAlign: TextAlign.center,
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
