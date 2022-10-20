
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../const/resource.dart';
import '../../../theme/app_theme.dart';


class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
    this.title,
    this.tailIcon,
    this.onTapTailIcon,
    this.showBack = true,
    this.tabBar,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  final bool showBack;
  final String? title;
  final String? tailIcon;
  final VoidCallback? onTapTailIcon;
  final TabBar? tabBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorWhite,
      elevation: 0.2,
      leading: showBack
          ? InkWell(
              onTap: () => Get.back(),
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: colorNeutralGray40)),
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(R.ASSETS_SVG_ADD_SVG),
                ),
              ),
            )
          : Container(),
      actions: [
        tailIcon != null
            ? InkWell(
                onTap: onTapTailIcon,
                child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: colorNeutralGray40)),
                    child: Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          tailIcon!,
                          color: colorBlack,
                        ))),
              )
            : Container()
      ],
      title: Text(
        title ?? "",
        style: typoBold16.copyWith(fontSize: 20),
      ),
      centerTitle: true,
      bottom: tabBar,
    );
  }
}
