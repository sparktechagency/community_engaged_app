import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/app_colors.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({
    super.key,
    this.textEditingController,
    this.isBoxShape = true,
    this.borderColor = AppColor.primaryColor,
    this.underlineColor = AppColor.primaryColor,
  });

  final TextEditingController? textEditingController;
  final bool isBoxShape;
  final Color borderColor;
  final Color underlineColor;

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
      autoDismissKeyboard: true,

      pinTheme: PinTheme(
        shape:isBoxShape? PinCodeFieldShape.box : PinCodeFieldShape.underline,
        borderRadius:isBoxShape ? BorderRadius.circular(8) : BorderRadius.zero,
        selectedColor: borderColor,
        activeFillColor: underlineColor,
        selectedFillColor: underlineColor.withOpacity(.5),
        inactiveFillColor: borderColor,
        fieldHeight: 50.h,
        fieldWidth: 50.w,
        inactiveColor: borderColor.withOpacity(.5),
        activeColor: borderColor,
        borderWidth: isBoxShape ? 2 :0,
        fieldOuterPadding: isBoxShape ? EdgeInsets.zero : EdgeInsets.symmetric(vertical: 4),
        // underlineColor: isBoxShape ? Colors.transparent : underlineColor,
      ),
      obscureText: false,
      keyboardType: TextInputType.number,
      onChanged: (value) {},
    );
  }
}
