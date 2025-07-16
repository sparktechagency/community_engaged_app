import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWithExternalTitle extends StatelessWidget {
  const TextFieldWithExternalTitle({
    super.key,
    this.controller,
    required this.titleName,
    required this.hintText,
    this.readOnly = false,
    this.isEmail,
    this.isPassword = false,
    this.prefixIcon,
    this.validator,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String titleName;
  final String hintText;
  final bool readOnly;
  final bool? isEmail;
  final bool isPassword;
  final Widget? prefixIcon;
  final String? Function(dynamic)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(titleName, style: TextStyle(fontSize: 16.sp)),
        CustomText(
          text: titleName,
          fontsize: 16.sp,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 2.h),
        CustomTextField(
          controller: controller ?? TextEditingController(),
          hintText: hintText,
          readOnly: readOnly,
          isEmail: isEmail,
          keyboardType: keyboardType,
          isPassword: isPassword,
          prefixIcon: prefixIcon,
          validator: validator,
        ),
      ],
    );
  }
}
