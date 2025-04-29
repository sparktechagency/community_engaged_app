import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<bool?> customPopUpWidget({
  required BuildContext context,
  required String title,
  required String subtitle,
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
        // title: Text(title, style: TextStyle(color: AppColor.themeColor)),
        title: CustomText(text: title,fontWeight: FontWeight.bold,fontsize: 18.sp,),
        // content: Text(subtitle),
        content: CustomText(text: subtitle,textOverflow: TextOverflow.fade,fontWeight: FontWeight.w500,),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              // fixedSize: Size(25, 15)
              side: BorderSide(color: AppColor.themeColor),
            ),
            onPressed: () {
              Get.back();
              if (onPressedFirstButton != null) onPressedFirstButton();
            },
            child: Text(
              firstButton!,
              style: TextStyle(color: AppColor.themeColor),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              // fixedSize: Size(25, 15)
              //   side: BorderSide(color: AppColor.themeColor)
              backgroundColor: AppColor.textButtonColor,
              foregroundColor: AppColor.cardColorE9F2F9,
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
