import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_pin_code_text_field.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddReferralCodeScreen extends StatefulWidget {
  const AddReferralCodeScreen({super.key});

  @override
  State<AddReferralCodeScreen> createState() => _AddReferralCodeScreenState();
}

class _AddReferralCodeScreenState extends State<AddReferralCodeScreen> {
  final TextEditingController _referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Sign Up',
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontsize: 20.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              Center(child: SvgPicture.asset(AppImage.referralCodeLogo)),
              SizedBox(height: 16.h),
              CustomText(
                text: 'Enter Referral Code',
                fontsize: 26,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: 'Use referral code to get exclusive things and go ahead!',
                textAlign: TextAlign.center,
                fontsize: 16,
                textOverflow: TextOverflow.fade,
                color: Colors.black87,
              ),
              SizedBox(height: 16.h),
              CustomPinCodeTextField(
                textEditingController: _referralCodeController,
                isBoxShape: false,
              ),
              SizedBox(height: 32.h),
              CustomButton(
                label: 'Sign Up',
                onPressed: () {
                  Get.toNamed(AppRoutes.mainBottomNavBarScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _referralCodeController.dispose();
  }
}
