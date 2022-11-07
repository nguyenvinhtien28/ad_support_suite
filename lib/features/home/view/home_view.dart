import 'package:ad_support_suite/core/utils/app_utils.dart';
import 'package:ad_support_suite/features/home/controllers/home_controller.dart';
import 'package:ad_support_suite/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/resource.dart';
import '../../../core/const/constans.dart';
import '../../../theme/app_theme.dart';
import '../components/create_post.dart';
import '../components/create_reel.dart';
import '../components/create_story.dart';
import '../components/more.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isShowStory = controller.isCheckPass.value;
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
                  width: Responsive.isMobile ? 80 : 130,
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
                              Obx(
                                () => controller.isCheckPass.value
                                    ? Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: colorWhite),
                                          width: Responsive.isMobile ? 25 : 35,
                                          padding: const EdgeInsets.all(4),
                                          child: Image.asset(
                                            R.ASSETS_PNG_INSTAGRAM_CR_PNG,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
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
                            Obx(
                              () => controller.isCheckPass.value
                                  ? Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: colorWhite),
                                        width: Responsive.isMobile ? 25 : 35,
                                        padding: const EdgeInsets.all(4),
                                        child: Image.asset(
                                          R.ASSETS_PNG_FACEBOOK_CR_PNG,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
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
                  GestureDetector(
                    onTap: () {
                      showBottomSheetCreatePost(context);
                    },
                    child: Container(
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
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showBottomSheetCreateReel(context);
                          },
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
                                  style:
                                      typoLight14.copyWith(color: colorBlack),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showDialogMore(context);
                          },
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
                                      style: typoLight14.copyWith(
                                          color: colorBlack),
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
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
                  Obx(
                    () => titleTodo(
                      () {
                        controller.isComment.value =
                            !controller.isComment.value;
                      },
                      'Comments',
                      controller.isComment.value
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      true,
                      controller.isComment.value ? "See All" : "",
                    ),
                  ),
                  Obx(
                    () => controller.isComment.value
                        ? Column(
                            children: [
                              ItemComment(
                                image: "assets/png/7896755.jpeg",
                                isFaceOrIG: true,
                                title: "Alex Sanchos       Good",
                                controller: controller,
                              ),
                              ItemComment(
                                image: "assets/png/8052261.jpeg",
                                isFaceOrIG: false,
                                title: "John Ney               It's amazing",
                                controller: controller,
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ),
                  Obx(
                    () => titleTodo(
                      () {
                        controller.isMes.value = !controller.isMes.value;
                      },
                      'Messager',
                      controller.isMes.value
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      true,
                      controller.isMes.value ? "See All" : "",
                    ),
                  ),
                  Obx(
                    () => titleTodo(
                      () {
                        controller.isTask.value = !controller.isTask.value;
                      },
                      'Tasks',
                      controller.isTask.value
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      true,
                      controller.isTask.value ? "See All" : "",
                    ),
                  ),
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
                      GestureDetector(
                        onTap: () {
                          showBottomSheetCreateStory(context,
                              isShowFbOrIG: isShowStory);
                        },
                        child: ItemRecentStories(
                          isFBorIG: true,
                          controller: controller,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 180,
                        margin: const EdgeInsets.symmetric(
                            horizontal: kDefaultWidePadding),
                        color: colorWhiteF2,
                      ),
                      GestureDetector(
                        onTap: () {
                          showBottomSheetCreateStory(context,
                              isShowFbOrIG: isShowStory);
                        },
                        child: ItemRecentStories(
                          isFBorIG: false,
                          controller: controller,
                        ),
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
                      Get.toNamed(Routes.OPTION,arguments: isShowStory);
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

  GestureDetector titleTodo(VoidCallback onTap, String title, IconData iconData,
      bool isSHow, String seeAll) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            title,
            style: typoBold14,
          ),
          const Expanded(child: SizedBox()),
          isSHow
              ? Text(
                  seeAll,
                  style: typoLight12.copyWith(color: colorBLue),
                )
              : Container(),
          const SizedBox(
            width: 4,
          ),
          Icon(iconData),
        ],
      ),
    );
  }
}

class ItemRecentStories extends StatelessWidget {
  const ItemRecentStories({
    Key? key,
    required this.isFBorIG,
    required this.controller,
  }) : super(key: key);

  final bool isFBorIG;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => controller.isCheckPass.value
              ? Row(
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
                )
              : const SizedBox(),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: Responsive.isMobile ? 30.w : 10.w,
          height: Responsive.isMobile ? 40.w : 15.w,
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
                        "assets/png/logojpg.jpg",
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
  const ItemComment({
    Key? key,
    required this.image,
    required this.isFaceOrIG,
    required this.title,
    required this.controller,
  }) : super(key: key);

  final String image;
  final bool isFaceOrIG;
  final String title;
  final HomeController controller;

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
                      height: Responsive.isMobile ? 35 : 45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
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
                      child: controller.isCheckPass.value
                          ? Image.asset(
                              isFaceOrIG
                                  ? R.ASSETS_PNG_FACEBOOK_CR_PNG
                                  : R.ASSETS_PNG_INSTAGRAM_CR_PNG,
                            )
                          : const SizedBox(),
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
