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

  // @override
  // Widget build(BuildContext context) {
  //   final width = MediaQuery.of(context).size.width;
  //   return Stack(
  //     alignment: Alignment.center,
  //     children: [
  //       Container(
  //         height: 180.h,
  //         width: 170.w,
  //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
  //         child: SvgPicture.asset(AppImage.customCard, fit: BoxFit.fill),
  //       ),
  //       Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           CustomText(
  //             text: cardTitle,
  //             fontsize: 18.sp,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.white,
  //           ),
  //           CustomText(
  //             text: cardSubtitle,
  //             fontsize: 18.sp,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.white,
  //           ),
  //           SizedBox(height: 48.h),
  //           GestureDetector(
  //             onTap: onTap,
  //             child: Container(
  //               alignment: Alignment.center,
  //               height: 34.h,
  //               width: 114.w,
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(16),
  //               ),
  //               child: CustomText(
  //                 text: buttonName,
  //                 fontsize: 16.sp,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
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
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
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
          height: 70.h,
          width: 165.w,
          decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            // border: Border(right: BorderSide.)
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100.r),
              topRight: Radius.circular(100.r),
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            ),
          ),
          // child: CustomButton(title: buttonName, onpress:()=>onTap),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              height: 34.h,
              width: 114.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: CustomText(
                text: buttonName,
                fontsize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
