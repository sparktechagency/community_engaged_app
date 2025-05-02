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
        padding: EdgeInsets.symmetric(horizontal: 46.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 96.h),
            Center(
              child: Image.asset(
                AppImage.splashScreenLogo,
                height: maxHeight *.38,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Chase Your Dream',
                  fontWeight: FontWeight.w900,
                  maxline: 2,
                  textAlign: TextAlign.start,
                  fontsize: 48.h,
                ),

                CustomText(
                  text:
                      'Join us in creating a brighter future. Your donations empower those in need, bringing hope and change to lives.',
                  fontsize: 17.h,
                  textOverflow: TextOverflow.fade,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.bold,
                  color: AppColor.secondaryColor,
                ),
              ],
            ),
            SizedBox(height: 40.h),
            CustomButton(
              title: 'Start Your Journey!',
              onpress: () {
                Get.toNamed(AppRoutes.signInScreen);
              },
            ),

          ],
        ),
      ),
    );
  }
}
