import 'package:community_engaged_app/gen/assets.gen.dart';
import 'package:community_engaged_app/gen/fonts.gen.dart';
import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/app_logo.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 120.h),
                Assets.icons.tarataniLogoFinal.image(
                  height: 128.h,
                  width: 128.w,
                ),
                SizedBox(height: 96.h),
                CustomTextField(
                  controller: _emailTEController,
                  hintText: 'Enter E-mail',
                  isEmail: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Icon(
                      Icons.email_outlined,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _passwordTEController,
                  hintText: 'Enter Password',
                  isPassword: true,
                  suffixIconColor: Colors.black,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(
                      AppImage.keyIconUrl,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.emailVerificationScreen);
                      },

                      child: CustomText(
                        text: 'Forget Password?',
                        color: AppColor.textButtonColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                CustomButton(label: "Let's Go", onPressed: _onTapSignInButton),
                SizedBox(height: 16.h),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account?  ",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                      fontFamily: FontFamily.poppins,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                          fontFamily: FontFamily.poppins,
                        ),
                        recognizer:
                            TapGestureRecognizer()..onTap = _onTapSignupButton,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    // if (_formKey.currentState!.validate()) {}
    Get.offAllNamed(AppRoutes.mainBottomNavBarScreen);
  }

  void _onTapSignupButton() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
