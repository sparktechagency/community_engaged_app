import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldForThisProject extends StatelessWidget {
  const TextFieldForThisProject({
    super.key,
    this.controller,
    required this.titleName,
    required this.hintText,
  });

  final TextEditingController? controller;
  final String titleName;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(titleName, style: TextStyle(fontSize: 16.sp)),
        CustomText(text: titleName,fontsize: 16.sp,color: Colors.black,),
        SizedBox(height: 2.h),
        CustomTextField(controller: controller ?? TextEditingController(), hintText: hintText),
      ],
    );
  }
}
