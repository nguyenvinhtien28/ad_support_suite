import 'package:ad_support_suite/core/const/constans.dart';
import 'package:ad_support_suite/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_theme.dart';

Future<bool?> showBottomSheetCreateStory(BuildContext context,
    {required bool isShowFbOrIG}) {
  return showModalBottomSheet<bool>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return ShowDialogCreateStory(
        isShowFbOrIG: isShowFbOrIG,
      );
    },
  );
}

class ShowDialogCreateStory extends StatefulWidget {
  const ShowDialogCreateStory({Key? key, required this.isShowFbOrIG})
      : super(key: key);
  final bool isShowFbOrIG;

  @override
  State<ShowDialogCreateStory> createState() => _ShowDialogCreateStoryState();
}

final _formKey = GlobalKey<FormState>();

class _ShowDialogCreateStoryState extends State<ShowDialogCreateStory> {
  bool isCamp = false;
  bool isChecked = false;
  bool isChecked1 = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Create Story",
                  style: typoBold14.copyWith(color: colorBLue),
                ),
              ),
              const SizedBox(
                height: kDefaultWidePadding,
              ),
              Text(
                'Add media to your story',
                style: typoBold14,
              ),
              Text(
                'Add photos or videos to your story.',
                style: typoLight14,
              ),
              Container(
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDefaultExThinPadding),
                  color: colorWhiteF2,
                ),
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Text(
                    "Add",
                    style: typoBold14.copyWith(color: colorBlack),
                  ),
                ),
              ),
              widget.isShowFbOrIG
                  ? Column(
                      children: [
                        const SizedBox(
                          height: kDefaultWidePadding,
                        ),
                        Text(
                          'Add media to your story',
                          style: typoBold14,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                checkColor: Colors.white,
                                value: isChecked,
                                shape: const CircleBorder(),
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: kDefaultExThinPadding,
                            ),
                            Text(
                              "Facebook",
                              style: typoBold14,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: kDefaultExThinPadding,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                checkColor: Colors.white,
                                value: isChecked1,
                                shape: const CircleBorder(),
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked1 = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: kDefaultExThinPadding,
                            ),
                            Text(
                              "Instagram",
                              style: typoBold14,
                            )
                          ],
                        ),
                      ],
                    )
                  : const SizedBox(),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.close(1);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Post successfully',
                          style: typoBold16,
                        ),
                        backgroundColor: colorBLue,
                      ),
                    );
                  }
                },
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(kDefaultExThinPadding),
                      color: colorBLue),
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Text(
                      "Post",
                      style: typoBold14.copyWith(color: colorWhite),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
