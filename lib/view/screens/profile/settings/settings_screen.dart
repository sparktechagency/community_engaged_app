import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_pop_up_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Settings',
          fontsize: 22.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 32.h),
              Expanded(
                child: Column(
                  children: [
                    GestureDetector(
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(AppRoutes.changePasswordScreen);
                        },
                        leading: Icon(
                          Icons.lock_open_outlined,
                          size: 30,
                          color: AppColor.primaryColor,
                        ),
                        title: CustomText(
                          text: 'Change Password',
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                          fontsize: 16.sp,
                          color: Colors.black,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    Divider(indent: 20, endIndent: 20),

                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.privacyPolicyScreen);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.privacy_tip_outlined,
                          size: 30,
                          color: AppColor.primaryColor,
                        ),
                        title: CustomText(
                          text: 'Privacy Policy',
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                          fontsize: 16.sp,
                          color: Colors.black,
                        ),

                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    Divider(indent: 20, endIndent: 20),

                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.termsOfServiceScreen);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.error_outline,
                          size: 30,
                          color: AppColor.primaryColor,
                        ),
                        title: CustomText(
                          text: 'Terms of Service',
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                          fontsize: 16.sp,
                          color: Colors.black,
                        ),

                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    Divider(indent: 20, endIndent: 20),

                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.aboutUsScreen);
                      },
                      child: ListTile(
                        leading: SvgPicture.asset(
                          AppImage.aboutUsIconUrl,
                          height: 32.h,
                          width: 32.w,
                          color: AppColor.primaryColor,
                        ),
                        title: CustomText(
                          text: 'About Us',
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                          fontsize: 16.sp,
                          color: Colors.black,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    Divider(indent: 20, endIndent: 20),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  customPopUpWidget(
                    context: context,
                    title: 'Delete Account!',
                    titleColor: Colors.red,
                    subtitle: 'Are you sure want to delete your account?',
                    firstButton: 'Cancel',
                    lastButton: 'Yes,Delete',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.textButtonColor,
                  foregroundColor: AppColor.cardColorE9F2F9,
                  // fixedSize: Size(double.maxFinite, 25)
                ),
                child: Row(
                  children: [
                    Icon(Icons.delete_outline_outlined),
                    SizedBox(width: 16.w),
                    Text('Delete Account'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
