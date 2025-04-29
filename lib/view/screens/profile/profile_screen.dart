import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/screens/404_page/404_page_screen.dart';
import 'package:community_engaged_app/view/widgets/custom_app_bar_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_pop_up_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/profile_picture_with_referral%20_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Center(child: ProfilePictureWithReferralCodeWidget()),
            SizedBox(height: 16.h),
            CustomText(
              text: 'Mohammed-Intellu',
              fontsize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.profileInformationScreen);
              },
              child: ListTile(
                leading: Icon(
                  Icons.perm_identity,
                  size: 30,
                  color: AppColor.themeColor,
                ),
                // title: Text(
                //   'Profile Information',
                //   style: TextStyle(
                //     fontWeight: FontWeight.w500,
                //     color: AppColor.themeColor,
                //   ),
                // ),
                title: CustomText(
                  text: 'Profile Information',
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.themeColor,
                ),
              ),
            ),
            // SizedBox(height: 8.h,),
            Divider(),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.settingScreen);
              },
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  size: 30,
                  color: AppColor.themeColor,
                ),
                title: CustomText(
                  text: 'Settings',
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                ),

                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.themeColor,
                ),
              ),
            ),
            // SizedBox(height: 8.h,),
            Divider(),
            GestureDetector(
              onTap: () {
                _onTapCustomPopUp(context);
              },
              child: ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  size: 30,
                  color: AppColor.themeColor,
                ),
                title: CustomText(
                  text: 'Log Out',
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.themeColor,
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  Future<bool?> _onTapCustomPopUp(BuildContext context) {
    return customPopUpWidget(
      context: context,
      title: 'Log Out!',
      subtitle: 'Are you sure want to Logout?',
      firstButton: 'Cancel',
      lastButton: 'Logout',
      onPressedLastButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ErrorScreen()),
        );
      },
    );
  }
}
