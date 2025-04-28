import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
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
        title: Text(title, style: TextStyle(color: AppColor.themeColor)),
        content: Text(subtitle),
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
