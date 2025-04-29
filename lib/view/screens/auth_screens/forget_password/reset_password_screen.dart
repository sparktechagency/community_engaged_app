import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        title: CustomText(text: 'Reset Password',color: Colors.black,fontWeight: FontWeight.bold,fontsize: 20,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Center(child: CircleAvatar(radius: 60.r)),
                SizedBox(height: 90.h),
                CustomTextField(
                  controller: _reTypePasswordTEController,
                  hintText: 'Enter Password',
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Icon(
                      Icons.key_outlined,
                      color: AppColor.themeColor.withOpacity(.5),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _passwordTEController,
                  hintText: 'Re-enter Password',
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Icon(
                      Icons.key_outlined,
                      color: AppColor.themeColor.withOpacity(.5),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                CustomElevatedButtonWidget(
                  buttonName: "Confirm",
                  onTapNext: _onTapSignInButton,
                ),
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
