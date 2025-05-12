import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<bool?> customPopUpWidget({
  required BuildContext context,
  required String title,
  required String subtitle,
  Color? titleColor,
  String? firstButton,
  String? lastButton,
  void Function()? onPressedFirstButton,
  void Function()? onPressedLastButton,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        alignment: Alignment.center,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: title,
              color: titleColor,
              fontWeight: FontWeight.bold,
              fontsize: 20.sp,
            ),
            Divider(),
            CustomText(
              text: subtitle,
              textOverflow: TextOverflow.fade,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontsize: 16.sp,
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: BorderSide(color: AppColor.primaryColor),
              minimumSize: Size(110.w, 54.h),
            ),
            onPressed: () {
              Get.back();
              if (onPressedFirstButton != null) onPressedFirstButton();
            },
            child: Text(
              firstButton!,
              style: TextStyle(color: AppColor.primaryColor),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.textButtonColor,
              foregroundColor: AppColor.cardColorE9F2F9,
              minimumSize: Size(110.w, 54.h),
            ),
            onPressed: () {
              Get.back();
              if (onPressedLastButton != null) onPressedLastButton();
            },
            child: Text(lastButton!),
          ),
        ],
      );
    },
  );
}
