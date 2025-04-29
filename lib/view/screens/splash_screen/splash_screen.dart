import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 140.h),
            Center(
              child: SizedBox(
                height: 200.h,
                width: 200.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 90.r,
                      backgroundColor: AppColor.primaryColor,
                    ),
                    SizedBox(
                      height: 400.h,
                      width: 400.w,
                      child: Image.asset(AppImage.splashScreenLogo),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppImage.splashScreenVerticalLineLogo),
                  SizedBox(height: 8.h),
                  // Text(
                  //   'Chase Your',
                  //   style: TextStyle(
                  //     fontSize: 48.sp,
                  //     fontWeight: FontWeight.bold,
                  //     color: AppColor.themeColor,
                  //   ),
                  // ),
                  CustomText(
                    text: 'Chase Your',
                    fontWeight: FontWeight.w700,
                    fontsize: 48.sp,
                  ),
                  CustomText(
                    text: 'Dream',
                    fontWeight: FontWeight.bold,
                    fontsize: 48.sp,
                  ),

                  // Text(
                  //   'Dream',
                  //   style: TextStyle(
                  //     fontSize: 48.sp,
                  //     fontWeight: FontWeight.bold,
                  //     color: AppColor.themeColor,
                  //   ),
                  // ),
                  // Text(
                  //   'Join us in creating a brighter future. Your donations empower those in need, bringing hope and change to lives.',
                  //   style: TextStyle(color: AppColor.themeColor),
                  // ),
                  CustomText(
                    text:
                        'Join us in creating a brighter future. Your donations empower those in need, bringing hope and change to lives.',
                    textOverflow: TextOverflow.fade,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            SizedBox(height: 48.h),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: CustomElevatedButtonWidget(
                buttonName: 'Start Your Journey!',
                onTapNext: () {
                  Get.offAllNamed(AppRoutes.signInScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
