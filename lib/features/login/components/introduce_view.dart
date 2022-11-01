import 'package:ad_support_suite/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/resource.dart';
import '../../../core/const/constans.dart';
import '../../../route/app_pages.dart';
import '../../../theme/app_theme.dart';

final listPage = [
  {
    "image": R.ASSETS_PNG_AD_PERR_PNG,
    "title": "Ad Performance Beyond Human Limits",
    "content": "✓ Ad set Storyline \n"
        "✓ Ads Manager 3.0 \n"
        "✓ Auto Ad Comment\n"
        "✓ Automated Reporting \n"
        "✓ Facebook Ads Dashboard \n"
        "✓ White-Labeling"
  },
  {
    "image": R.ASSETS_PNG_AUTOMATION_PNG,
    "title": "Automation Tactics",
    "content": "✓ Automation Tactics \n"
        "✓ Autonomous Budget Optimizer \n"
        "✓ Custom Automation\n"
        "✓ Facebook Ad Automation Software "
  },
  {
    "image": R.ASSETS_PNG_CREATIVE_PNG,
    "title": "Creatives",
    "content": "✓ AI Copywriter \n"
        "✓ Ad Copy Insights \n"
        "✓ Creative Insights"
  },
  {
    "image": R.ASSETS_PNG_TARRGETING_PNG,
    "title": "Targeting",
    "content": "✓ Ad Launcher \n"
        "✓ Audience Launcher \n"
        "✓ Audience Studio \n"
        "Bid Testing \n"
        "Hidden Insights \n"
        "Facebook Target Audience Finder"
  },
];

class IntroduceView extends StatefulWidget {
  const IntroduceView({
    Key? key,
  }) : super(key: key);

  @override
  State<IntroduceView> createState() => _IntroduceViewState();
}

class _IntroduceViewState extends State<IntroduceView> {
  final controllers = PageController(viewportFraction: 1, initialPage: 0);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            SizedBox(
              height: 65.h,
              child: PageView.builder(
                  itemCount: listPage.length,
                  pageSnapping: true,
                  controller: controllers,
                  onPageChanged: (page) {
                    setState(() {
                      pageIndex = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    final data = listPage[index];
                    return Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              data['image']!,
                              width: Responsive.isMobile ? 60.w : 50.w,
                            ),
                          ),
                          Text(
                            data['title']!,
                            style: typoBold22.copyWith(color: colorBLue),
                          ),
                          const SizedBox(
                            height: kDefaultExThinPadding,
                          ),
                          Text(
                            data['content']!,
                            style: typoLight16.copyWith(color: colorText80),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.close(1);
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultThinPadding,
                        vertical: kDefaultExThinPadding),
                    child: Text(
                      "Skip",
                      style: typoBold18.copyWith(color: colorBLue),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: listPage.map(
                      (element) {
                        if (listPage.indexOf(element) == pageIndex) {
                          return Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 2),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              color: colorBLue,
                            ),
                            child: Center(
                              child: Container(
                                width: 4,
                                height: 4,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  color: colorWhite,
                                ),
                              ),
                            ),
                          );
                        }
                        return Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 4.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: colorBLue,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (pageIndex == 3) Get.toNamed(Routes.LOGIN_FACEBOOK);
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultThinPadding,
                        vertical: kDefaultExThinPadding),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(kDefaultExThinPadding),
                        color: pageIndex == 3 ? colorBLue : colorWhite),
                    child: Text(
                      "Start",
                      style: typoBold18.copyWith(color: colorWhite),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
