import 'package:community_engaged_app/gen/assets.gen.dart';
import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/app_logo.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'E-mail Verification',
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
              CustomTextField(
                controller: _emailTEController,
                hintText: '  Enter E-mail',
                isEmail: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Icon(
                    Icons.email_outlined,
                    color: AppColor.primaryColor.withOpacity(.5),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              CustomButton(label: 'Send OTP', onPressed: _onTapOtpVerification),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapOtpVerification() {
    Get.toNamed(AppRoutes.otpVerificationScreen);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
