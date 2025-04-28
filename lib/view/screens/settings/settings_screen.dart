import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_pop_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        title: Text('Settings', style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Padding(
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
                        Icons.lock,
                        size: 30,
                        color: AppColor.themeColor,
                      ),
                      title: Text(
                        'Change Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColor.themeColor,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.themeColor,
                      ),
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.privacyPolicyScreen);
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.privacy_tip,
                        size: 30,
                        color: AppColor.themeColor,
                      ),
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColor.themeColor,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.themeColor,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.error,
                      size: 30,
                      color: AppColor.themeColor,
                    ),
                    title: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.termsOfServiceScreen);
                      },
                      child: Text(
                        'Terms of service',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColor.themeColor,
                        ),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColor.themeColor,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.question_answer,
                      size: 30,
                      color: AppColor.themeColor,
                    ),
                    title: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.aboutUsScreen);
                      },
                      child: Text(
                        'About us',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColor.themeColor,
                        ),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColor.themeColor,
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                customPopUpWidget(
                  context: context,
                  title: 'Delete Account!',
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
    );
  }
}
