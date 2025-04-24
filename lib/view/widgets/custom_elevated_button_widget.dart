import 'package:community_engaged_app/utils/app_colors.dart';
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
        textStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w500),
        fixedSize: Size.fromWidth(double.maxFinite),
        backgroundColor: AppColor.themeColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Text(buttonName),
    );
  }
}