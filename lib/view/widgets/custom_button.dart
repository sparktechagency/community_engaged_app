import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;
  final String title;
  final Color? color;
  final Color? titlecolor;
  final double? height;
  final double? width;
  final double? fontSize;
  final bool loading;

  CustomButton({
    super.key,
    required this.title,
    required this.onpress,
    this.color,
    this.height,
    this.width,
    this.fontSize,
    this.titlecolor,
    this.loading=false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:loading?(){} :onpress,
      child: Container(
        width:width?? double.infinity,
        height: height ?? 52.h,
        padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(50.r),
          border: Border.all(color: AppColor.primaryColor),
          color: color ?? AppColor.primaryColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            loading?  SizedBox(
              height: 20.h,
              width: 20.h,
              child: const CircularProgressIndicator(color: Colors.white,),
            ):
            Center(
              child: CustomText(
                text: title,
                fontsize: fontSize ?? 20.sp,
                color: titlecolor ?? Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}