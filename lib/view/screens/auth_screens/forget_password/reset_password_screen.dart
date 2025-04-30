import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _reTypePasswordTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Reset Password',color: Colors.black,fontWeight: FontWeight.bold,fontsize: 20.sp,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Center(child: CircleAvatar(radius: 60.r)),
                SizedBox(height: 90.h),
                CustomTextField(
                  controller: _passwordTEController,
                  hintText: 'Enter Password',
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: SvgPicture.asset(AppImage.keyIconUrl)
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _reTypePasswordTEController,
                  hintText: 'Re-enter Password',
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: SvgPicture.asset(AppImage.keyIconUrl)
                  ),
                ),
                SizedBox(height: 32.h),
                // CustomElevatedButtonWidget(
                //   buttonName: "Confirm",
                //   onTapNext: _onTapSignInButton,
                // ),
                CustomButton(title: 'Confirm', onpress: _onTapSignInButton)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    _reTypePasswordTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
