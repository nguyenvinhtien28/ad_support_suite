import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../const/resource.dart';
import '../../../core/const/constans.dart';
import '../../../route/app_pages.dart';
import '../../../theme/app_theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhiteFA,
        automaticallyImplyLeading: false,
        elevation: 0.2,
        titleSpacing: 16,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nguyen Van A",
              style: typoBold18.copyWith(color: colorText100),
            ),
            const SizedBox(
              width: 4,
            ),
            SizedBox(
                height: 12,
                width: 12,
                child: SvgPicture.asset(R.ASSETS_SVG_ANGLE_SMALL_DOWN_SVG)),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.OPTION);
              },
              child: SvgPicture.asset(
                R.ASSETS_SVG_ADD_SVG,
                color: skyBlue[900],
                width: 28,
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
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultExThinPadding),
              child: Row(
                children: [
                  Text(
                    "Advertising campaign",
                    style: typoBold16,
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorWhiteF2,
                    ),
                    padding: const EdgeInsets.all(kDefaultExThinPadding),
                    child: SizedBox(
                      width: 12,
                      height: 12,
                      child: SvgPicture.asset(
                        R.ASSETS_SVG_STATS_SVG,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: colorWhiteF2,
              ),
              margin: const EdgeInsets.only(left: kDefaultPadding),
              padding: const EdgeInsets.all(kDefaultExThinPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Fiter",
                    style: typoRegular14.copyWith(color: colorText100),
                    maxLines: 2,
                  ),
                  SizedBox(
                    width: 12,
                    height: 12,
                    child: SvgPicture.asset(
                      "",
                      color: colorText100,
                    ),
                  ),
                ],
              ),
            ),
            const CampaignItem(),
            const CampaignItem(),
            const CampaignItem(),
            const CampaignItem(),
            const CampaignItem(),
            const CampaignItem(),
          ],
        ),
      ),
    );
  }
}

class CampaignItem extends StatelessWidget {
  const CampaignItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        top: kDefaultExThinPadding,
        bottom: kDefaultExThinPadding,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultPadding),
          color: colorWhite,
          boxShadow: boxShadow),
      padding: const EdgeInsets.all(kDefaultExThinPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 0.6,
            child: CupertinoSwitch(
              activeColor: skyBlue[200],
              thumbColor: skyBlue[900],
              value: true,
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name campaign",
                      style: typoRegular14.copyWith(color: skyBlue[600]),
                      maxLines: 2,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.all(4),
                      child: SvgPicture.asset(
                        R.ASSETS_SVG_MENU_DOTS_VERTICAL_SVG,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colorGreen,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Bản nháp",
                      style: typoLight12.copyWith(color: colorText80),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CampItem(
                      title: '0',
                      content: "Đã bắt đầu cuộc trò chuyện qua tin nhắn",
                    ),
                    CampItem(
                      title: '0',
                      content:
                          "Chi phí trên mỗi lần bắt đầu cuộc trò chuyện qua tin nhắn",
                    ),
                    CampItem(
                      title: '0',
                      content: "Đã chi tiêu",
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox()
        ],
      ),
    );
  }
}

class CampItem extends StatelessWidget {
  const CampItem({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: typoBold14.copyWith(color: colorText80),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              content,
              style: typoLight12.copyWith(color: colorText60),
              maxLines: 4,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
