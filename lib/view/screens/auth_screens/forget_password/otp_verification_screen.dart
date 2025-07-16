import 'dart:async';

import 'package:community_engaged_app/gen/assets.gen.dart';
import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/app_logo.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_pin_code_text_field.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  Timer? _timer;
  int _start = 0;

  void startTimer() {
    setState(() {
      _start = 150;
    });
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String get timerText {
    final minutes = _start ~/ 60;
    final seconds = _start % 60;
    return '${minutes.toString()}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final bool isWaiting = _start > 0;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'OTP Verification',
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontsize: 20.sp,
        ),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Assets.icons.tarataniLogoFinal.image(
                height: 128.h,
                width: 128.w,
              ),
              SizedBox(height: 96.h),
              CustomPinCodeTextField(),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Didn't get the code?",
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  isWaiting
                      ? CustomText(
                        text: 'Resend code in $timerText',
                        fontWeight: FontWeight.w400,
                      )
                      : GestureDetector(
                        onTap: () {
                          isWaiting ? null : startTimer();
                        },
                        child: CustomText(
                          text: 'Resend',
                          color: AppColor.textButtonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ],
              ),
              SizedBox(height: 32.h),
              CustomButton(label: 'Verify', onPressed: (){
                Get.toNamed(AppRoutes.resetPasswordScreen);
              })
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
