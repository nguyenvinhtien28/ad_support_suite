import 'package:ad_support_suite/core/utils/app_utils.dart';
import 'package:ad_support_suite/features/home/controllers/home_controller.dart';
import 'package:ad_support_suite/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/resource.dart';
import '../../../core/const/constans.dart';
import '../../../theme/app_theme.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhiteFA,
        automaticallyImplyLeading: false,
        elevation: 0.2,
        titleSpacing: 16,
        toolbarHeight: 90,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width:Responsive.isMobile ? 80 : 130,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: colorWhite),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: skyBlue[200]),
                                  width: Responsive.isMobile ? 35 : 60,
                                  child: Image.asset(
                                    R.ASSETS_PNG_LOGO_PNG,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: colorWhite),
                                  width: Responsive.isMobile ? 25 : 35,
                                  padding: const EdgeInsets.all(4),
                                  child: Image.asset(
                                    R.ASSETS_PNG_INSTAGRAM_CR_PNG,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: colorWhite),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: skyBlue[200]),
                                width: Responsive.isMobile ? 35 : 60,
                                child: Image.asset(
                                  R.ASSETS_PNG_LOGO_PNG,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: colorWhite),
                                width: Responsive.isMobile ? 25 : 35,
                                padding: const EdgeInsets.all(4),
                                child: Image.asset(
                                  R.ASSETS_PNG_FACEBOOK_CR_PNG,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  controller.name,
                  style: typoBold18.copyWith(color: colorText100),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.arrow_drop_down_circle_outlined,
                color: colorBLue,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDefaultPadding),
                  color: colorWhite),
              margin: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultExThinPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(kDefaultExThinPadding),
                        color: colorBLue),
                    margin: const EdgeInsets.symmetric(
                      horizontal: kDefaultExThinPadding,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: Text(
                        "Create Post",
                        style: typoBold14.copyWith(color: colorWhite),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  kDefaultExThinPadding,
                                ),
                                color: colorWhiteF2),
                            margin: const EdgeInsets.symmetric(
                                horizontal: kDefaultExThinPadding),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                              child: Text(
                                "Create Reel",
                                style: typoLight14.copyWith(color: colorBlack),
                              ),
                            )),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    kDefaultExThinPadding),
                                color: colorWhiteF2),
                            margin: const EdgeInsets.symmetric(
                                horizontal: kDefaultExThinPadding),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "More",
                                    style:
                                        typoLight14.copyWith(color: colorBlack),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 14,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 260,
              width: 100.w,
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultExThinPadding),
              margin: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultExThinPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: colorWhite),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "To-do list",
                    style: typoBold16,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Check unread messages, comments and other things that may require your attention.",
                    style: typoLight14,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  titleTodo(
                      'Comments', Icons.keyboard_arrow_down_rounded, true),
                  const ItemComment(
                    image: R.ASSETS_PNG_LOGO_PNG,
                    isFaceOrIG: true,
                    title: "Alex Sanchos...  This is ad support",
                  ),
                  const ItemComment(
                    image: R.ASSETS_PNG_LOGO_PNG,
                    isFaceOrIG: false,
                    title: "Alex Sanchos...  This is ad support",
                  ),
                  titleTodo('Messager', Icons.keyboard_arrow_up_rounded, false),
                  titleTodo('Tasks', Icons.keyboard_arrow_up_rounded, false),
                ],
              ),
            ),
            Container(
              height: 240,
              width: 100.w,
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultExThinPadding),
              margin: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultExThinPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: colorWhite),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent stories",
                    style: typoBold16,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      const ItemRecentStories(
                        isFBorIG: true,
                      ),
                      Container(
                        width: 1,
                        height: 180,
                        margin: const EdgeInsets.symmetric(
                            horizontal: kDefaultWidePadding),
                        color: colorWhiteF2,
                      ),
                      const ItemRecentStories(
                        isFBorIG: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              width: 100.w,
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultExThinPadding),
              margin: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultExThinPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: colorWhite),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Insights",
                    style: typoBold16,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Trend",
                    style: typoBold16,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Last 28 days: 27 September – 24 October.",
                    style: typoLight14.copyWith(color: colorText80),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  itemInsights('Facebook Page reach', '8   ', '↑ 33%'),
                  itemInsights('Instagram reach', '0 --', ''),
                  const Divider(
                    height: 30,
                  ),
                  Text(
                    "Audience",
                    style: typoBold16,
                  ),
                  Text(
                    "Current",
                    style: typoLight14.copyWith(color: colorText80),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  itemInsights('Facebook Page followers', '4.6k', ''),
                  itemInsights('Instagram followers', '1k', ''),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.OPTION);
                    },
                    child: Container(
                      width: 100.w,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: colorWhiteF2),
                      child: Center(
                        child: Text(
                          "See All Insights",
                          style: typoLight14.copyWith(color: colorText80),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Row itemInsights(String title, String content1, String content2) {
    return Row(
      children: [
        Text(
          title,
          style: typoLight14.copyWith(color: colorText80),
        ),
        const SizedBox(
          width: 4,
        ),
        const Icon(
          Icons.error,
          size: 10,
        ),
        const Expanded(child: SizedBox()),
        RichText(
          text: TextSpan(
            text: content1,
            style: typoBold14.copyWith(color: colorBlack),
            children: <TextSpan>[
              TextSpan(
                text: content2,
                style: typoLight14.copyWith(color: colorGreen),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row titleTodo(String title, IconData iconData, bool isSHow) {
    return Row(
      children: [
        Text(
          title,
          style: typoBold14,
        ),
        const Expanded(child: SizedBox()),
        isSHow
            ? Text(
                "See all",
                style: typoLight12.copyWith(color: colorBLue),
              )
            : Container(),
        const SizedBox(
          width: 4,
        ),
        Icon(iconData),
      ],
    );
  }
}

class ItemRecentStories extends StatelessWidget {
  const ItemRecentStories({
    Key? key,
    required this.isFBorIG,
  }) : super(key: key);

  final bool isFBorIG;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 16,
              child: Image.asset(isFBorIG
                  ? R.ASSETS_PNG_FACEBOOK_CR_PNG
                  : R.ASSETS_PNG_INSTAGRAM_CR_PNG),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              isFBorIG ? "Facebook" : "Instagram",
              style: typoBold14,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width:Responsive.isMobile ? 30.w : 10.w,
          height: Responsive.isMobile ?40.w : 15.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: colorWhiteF2,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Responsive.isMobile ? 30.w : 10.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(
                      height: Responsive.isMobile ? 27.w : 10.w,
                      width: Responsive.isMobile ? 30.w : 10.w,
                      child: Image.asset(
                        R.ASSETS_PNG_LOGOTEXT1_PNG,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(bottom: 0, child: Icon(Icons.add_circle))
                  ],
                ),
              ),
              const SizedBox(
                height: kDefaultThinPadding,
              ),
              Text(
                "Create Story",
                style: typoBold14,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ItemComment extends StatelessWidget {
  const ItemComment(
      {Key? key,
      required this.image,
      required this.isFaceOrIG,
      required this.title})
      : super(key: key);

  final String image;
  final bool isFaceOrIG;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
              color: colorBLue, borderRadius: BorderRadius.circular(6)),
        ),
        Stack(
          children: [
            Positioned(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: colorWhite),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: skyBlue[200]),
                      width: Responsive.isMobile ? 35 : 45,
                      child: Image.asset(
                        image,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: colorWhite),
                      width: Responsive.isMobile ? 20 : 35,
                      padding: const EdgeInsets.all(3),
                      child: Image.asset(
                        isFaceOrIG
                            ? R.ASSETS_PNG_FACEBOOK_CR_PNG
                            : R.ASSETS_PNG_INSTAGRAM_CR_PNG,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: typoBold14,
        ),
        const Expanded(child: SizedBox()),
        Text(
          "1m",
          style: typoLight12,
        ),
      ],
    );
  }
}
