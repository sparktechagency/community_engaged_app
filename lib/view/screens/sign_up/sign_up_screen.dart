import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text_field.dart';
import 'package:community_engaged_app/view/widgets/step_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                StepProgressBar(currentStep: 1),
                SizedBox(height: 40.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Name', style: TextStyle(fontSize: 16.sp)),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      controller: _nameTEController,
                      hintText: 'Your name',
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone', style: TextStyle(fontSize: 16.sp)),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      controller: _phoneTEController,
                      hintText: 'Phone number',
                    ),
                  ],
                ),

                SizedBox(height: 8.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('E-mail', style: TextStyle(fontSize: 16.sp)),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      controller: _emailTEController,
                      hintText: 'email',
                      isEmail: true,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Password', style: TextStyle(fontSize: 16.sp)),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      controller: _passwordTEController,
                      hintText: 'password',
                      isPassword: true,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address', style: TextStyle(fontSize: 16.sp)),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      controller: _addressTEController,
                      hintText: 'address',
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomElevatedButtonWidget(
                  buttonName: "Confirm",
                  // onTapNext: _onTapSignInButton,
                  onTapNext: () {
                    Get.toNamed(AppRoutes.nidPictureScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.nidPictureScreen);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameTEController.dispose();
    _phoneTEController.dispose();
    _addressTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
