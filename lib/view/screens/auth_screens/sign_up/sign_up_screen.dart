import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/step_progress_bar.dart';
import 'package:community_engaged_app/view/widgets/text_field_for_this_project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
  bool _agreeButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Sign Up',
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontsize: 20,
        ),

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
                TextFieldWithExternalTitle(
                  controller: _nameTEController,
                  titleName: 'Your Name',
                  hintText: 'Name',
                ),
                SizedBox(height: 8.h),

                TextFieldWithExternalTitle(
                  controller: _phoneTEController,
                  titleName: 'Phone',
                  hintText: 'Phone Number',
                ),
                SizedBox(height: 8.h),
                TextFieldWithExternalTitle(
                  controller: _addressTEController,
                  titleName: 'Address',
                  hintText: 'Your address',
                ),
                SizedBox(height: 8.h),
                TextFieldWithExternalTitle(
                  controller: _emailTEController,
                  titleName: 'E-mail',
                  hintText: 'Email address',
                  isEmail: true,
                ),
                SizedBox(height: 8.h),

                TextFieldWithExternalTitle(
                  controller: _passwordTEController,
                  titleName: 'Password',
                  hintText: 'Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 8),
                    child: SvgPicture.asset(AppImage.keyIconUrl),
                  ),
                  isPassword: true,
                ),
                SizedBox(height: 16.h),
                _checkBoxForTermsAndConditions(),
                SizedBox(height: 40.h),
                CustomButton(title: 'Confirm', onpress: _onTapSignInButton),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _checkBoxForTermsAndConditions() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _agreeButton = !_agreeButton;
                      });
                    },
                    child:
                        _agreeButton
                            ? Icon(
                              Icons.check_box,
                              color: AppColor.primaryColor,
                            )
                            : Icon(
                              Icons.check_box_outline_blank_outlined,
                              color: AppColor.primaryColor,
                            ),
                  ),
                  SizedBox(width: 16.h),
                  CustomText(
                    text: 'Agree with',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8.h),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.termsOfServiceScreen);
                    },
                    child: CustomText(
                      text: 'Terms of Service',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              );
  }

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
      if (_agreeButton == true) {
        Get.toNamed(AppRoutes.nidPictureScreen);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please agree to the terms of service to continue'),
            backgroundColor: Colors.red,
          ),
        );
      }
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
