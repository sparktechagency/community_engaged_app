import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 140.h,
          width: 170.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: SvgPicture.asset(AppImage.customCard, fit: BoxFit.fill),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
              text: cardTitle,
              fontsize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            CustomText(
              text: cardSubtitle,
              fontsize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: onTap,
              child: Container(
                alignment: Alignment.center,
                height: 34.h,
                width: 114.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CustomText(
                  text: buttonName,
                  fontsize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
