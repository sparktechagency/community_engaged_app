import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferralUsersScreen extends StatefulWidget {
  const ReferralUsersScreen({super.key});

  @override
  State<ReferralUsersScreen> createState() => _ReferralUsersScreenState();
}

class _ReferralUsersScreenState extends State<ReferralUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Referral Users',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontsize: 22.sp,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.primaryColor.withOpacity(.2),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(AppImage.splashScreenLogo),
                  radius: 26,
                ),
                title: CustomText(
                  text: 'Jane Cooper',
                  color: Colors.black,
                  fontsize: 18.sp,
                  textAlign: TextAlign.start,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
