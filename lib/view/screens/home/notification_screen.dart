import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24, top: 16),
          child: SvgPicture.asset(AppImage.homeLogo, fit: BoxFit.contain),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 8),
            child: IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.notificationScreen);
              },
              icon: Stack(
                alignment: Alignment(1,-1.5),
                children: [
                  Icon(
                    Icons.notifications,
                    size: 30.h,
                    color: AppColor.themeColor,
                  ),
                  Container(
                    width: 20.w,
                    decoration: BoxDecoration(
                        color: AppColor.textButtonColor,
                        shape: BoxShape.circle
                    ),
                    child: Text('01',style: TextStyle(color: AppColor.cardColorE9F2F9),),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
