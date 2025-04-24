import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/app_colors.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({super.key,this.textEditingController});
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return  PinCodeTextField(
      backgroundColor: Colors.transparent,
      cursorColor: AppColor.cardColorE9F2F9,
      controller: textEditingController,
      textStyle: const TextStyle(color: Colors.black),
      autoFocus: false,
      appContext: context,
      length: 6,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          selectedColor: AppColor.themeColor,
          activeFillColor: AppColor.themeColor,
          selectedFillColor: AppColor.themeColor.withOpacity(.5),
          inactiveFillColor: AppColor.themeColor,
          fieldHeight: 50.h,
          fieldWidth: 50.w,
          inactiveColor: AppColor.themeColor.withOpacity(.5),
          activeColor: AppColor.themeColor),
      obscureText: false,
      keyboardType: TextInputType.number,
      onChanged: (value) {},
    );
  }
}