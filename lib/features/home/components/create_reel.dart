import 'package:ad_support_suite/core/const/constans.dart';
import 'package:ad_support_suite/core/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_theme.dart';

Future<bool?> showBottomSheetCreateReel(
  BuildContext context,
) {
  return showModalBottomSheet<bool>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return const ShowDialogCreateReel();
    },
  );
}

class ShowDialogCreateReel extends StatefulWidget {
  const ShowDialogCreateReel({Key? key}) : super(key: key);

  @override
  State<ShowDialogCreateReel> createState() => _ShowDialogCreateReelState();
}

final _formKey = GlobalKey<FormState>();

class _ShowDialogCreateReelState extends State<ShowDialogCreateReel> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Create Reel",
                  style: typoBold14.copyWith(color: colorBLue),
                ),
              ),
              const SizedBox(
                height: kDefaultWidePadding,
              ),
              Text(
                'Media',
                style: typoBold14,
              ),
              Text(
                'Upload a video to be published as a reel.',
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
              const SizedBox(
                height: kDefaultWidePadding,
              ),
              Text(
                'Reel details',
                style: typoBold14,
              ),
              const SizedBox(
                height: kDefaultExThinPadding,
              ),
              Text(
                'Caption reel',
                style: typoBold14,
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                style: typoLight12,
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Describe your reel',
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
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
