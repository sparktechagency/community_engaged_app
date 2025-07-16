import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
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
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 96.h),
            Center(
              child: Image.asset(
                AppImage.splashScreenLogo,
                height: maxHeight * .38,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Chase Your Dream',
                  fontWeight: FontWeight.bold,
                  maxline: 2,
                  textAlign: TextAlign.start,
                  color: AppColor.primaryColor,
                  fontsize: 48.h,
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text:
                      'Join us in creating a brighter future. Your donations empower those in need, bringing hope and change to lives.',
                  // fontsize: 17.h,
                  textOverflow: TextOverflow.fade,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ],
            ),
            SizedBox(height: 40.h),
            CustomButton(
              label: 'Start Your Journey !',
              onPressed: () {
                Get.offAllNamed(AppRoutes.signInScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
