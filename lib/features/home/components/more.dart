import 'package:ad_support_suite/core/const/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_theme.dart';

Future<bool?> showDialogMore(
  BuildContext context,
) {
  return showDialog<bool>(
    context: context,
    builder: (_) {
      return const ShowDialogMore();
    },
  );
}

class ShowDialogMore extends StatefulWidget {
  const ShowDialogMore({Key? key}) : super(key: key);

  @override
  State<ShowDialogMore> createState() => _ShowDialogMoreState();
}

final _formKey = GlobalKey<FormState>();

class _ShowDialogMoreState extends State<ShowDialogMore> {
  bool isCamp = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding))),
      content: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.close(1);
                  },
                  child: Center(
                    child: Text(
                      "Create Story",
                      style: typoBold14.copyWith(color: colorBlack),
                    ),
                  ),
                ),
                const SizedBox(
                  height: kDefaultWidePadding,
                ),
                GestureDetector(
                  onTap: () {
                    Get.close(1);
                  },
                  child: Text(
                    "Live",
                    style: typoBold14.copyWith(color: colorBlack),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
