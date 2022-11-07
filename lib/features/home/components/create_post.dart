import 'package:ad_support_suite/core/const/constans.dart';
import 'package:ad_support_suite/core/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_theme.dart';

Future<bool?> showBottomSheetCreatePost(
  BuildContext context,
) {
  return showModalBottomSheet<bool>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return const ShowBottomSheetCreatePost();
    },
  );
}

class ShowBottomSheetCreatePost extends StatefulWidget {
  const ShowBottomSheetCreatePost({Key? key}) : super(key: key);

  @override
  State<ShowBottomSheetCreatePost> createState() => _ShowBottomSheetCreatePostState();
}

final _formKey = GlobalKey<FormState>();

class _ShowBottomSheetCreatePostState extends State<ShowBottomSheetCreatePost> {
  bool isCamp = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Create Post",
                  style: typoBold14.copyWith(color: colorBLue),
                ),
              ),
              const SizedBox(
                height: kDefaultWidePadding,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 20,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: CupertinoSwitch(
                        activeColor: skyBlue[200],
                        thumbColor: skyBlue[900],
                        value: isCamp,
                        onChanged: (value) {
                          setState(() {
                            isCamp = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: kDefaultExThinPadding,
                  ),
                  Text(
                    'Boost post',
                    style: typoLight14,
                  ),
                ],
              ),
              const SizedBox(
                height: kDefaultExThinPadding,
              ),
              SizedBox(
                height: 100,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  style: typoLight12,
                  maxLines: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Content',
                    contentPadding: const EdgeInsets.all(8),
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
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
                      borderRadius: BorderRadius.circular(kDefaultExThinPadding),
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
