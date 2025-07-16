import 'package:community_engaged_app/gen/assets.gen.dart';
import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: Padding(
      //   padding: const EdgeInsets.only(left: 24, top: 16),
      //   child: SvgPicture.asset(AppImage.homeLogo, fit: BoxFit.contain,color: AppColor.primaryColor,),
      // ),
      // leading: Row(
      //   children: [
      //     SizedBox(width: 20.w),
      //
      //   ],
      // ),
      leadingWidth: 70.w,
      leading: Row(
        children: [
          SizedBox(width: 18.w,),
          Expanded(child: Assets.icons.tarataniLogoFinal.image(height: 60.h, width: 60.w)),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.notificationScreen);
            },
            icon: Badge.count(
              count: 18,
              child: Icon(
                // Icons.notifications_none_outlined,
                CupertinoIcons.bell,
                color: AppColor.primaryColor,
                size: 30.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
