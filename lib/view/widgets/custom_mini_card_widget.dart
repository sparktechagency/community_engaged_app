import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

///this card is used for show the available balance and withdraw and
///referral code and with a elevated button
///for direction to these screens
class CustomMiniCardWidget extends StatelessWidget {
  const CustomMiniCardWidget({
    super.key,
    required this.context,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.buttonName,
    required this.onTap,
  });

  final String cardTitle;
  final String cardSubtitle;
  final BuildContext context;
  final String buttonName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          alignment: Alignment.center,
          height: 170.h,
          width: 165.w,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.r),
              topLeft: Radius.circular(16.r),
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: Column(
              children: [
                CustomText(
                  text: cardTitle,
                  fontsize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                CustomText(
                  text: cardSubtitle,
                  fontsize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),

        ///half curved container
        Container(
          alignment: Alignment.center,
          height: 60.h,
          width: 165.w,
          decoration: BoxDecoration(
            color: Color(0xFF000A3A),
            // border: Border(right: BorderSide.)
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10000.r),
              topRight: Radius.circular(10000.r),
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            ),
          ),
          // child: CustomButton(title: buttonName, onpress:()=>onTap),
          child: CustomButton(
            onPressed: () {},
            label: buttonName,
            height: 34.h,
            width: 114.w,
            backgroundColor: Colors.white,
            foregroundColor: AppColor.primaryColor,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
