import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/app_colors.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({super.key, this.textEditingController});

  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      backgroundColor: Colors.transparent,
      cursorColor: Colors.black,
      controller: textEditingController,
      textStyle: const TextStyle(color: Colors.black),
      autoFocus: false,
      appContext: context,
      length: 6,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        selectedColor: AppColor.primaryColor,
        activeFillColor: AppColor.primaryColor,
        selectedFillColor: AppColor.primaryColor.withOpacity(.5),
        inactiveFillColor: AppColor.primaryColor,
        fieldHeight: 50.h,
        fieldWidth: 50.w,
        inactiveColor: AppColor.primaryColor.withOpacity(.5),
        activeColor: AppColor.primaryColor,
      ),
      obscureText: false,
      keyboardType: TextInputType.number,
      onChanged: (value) {},
    );
  }
}
