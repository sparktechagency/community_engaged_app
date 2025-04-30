import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
   const CustomElevatedButtonWidget({
    super.key, required this.buttonName, required this.onTapNext,
  });
  final String buttonName;
  final  Function() onTapNext;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapNext,
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(double.maxFinite),
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
      child: CustomText(text: buttonName,fontsize: 16.sp,fontWeight: FontWeight.bold,color: Colors.white,),
    );
  }
}