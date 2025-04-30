import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/custom_text_field.dart';
import 'package:community_engaged_app/view/widgets/text_field_for_this_project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordTEController =
      TextEditingController();
  final TextEditingController _newPasswordTEController =
      TextEditingController();
  final TextEditingController _reTypepasswordTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Change Password',
          fontsize: 22.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
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
                TextFieldForThisProject(
                  controller: _currentPasswordTEController,
                  titleName: 'Current Password',
                  hintText: 'Current Password',
                ),
                SizedBox(height: 16.h),
                TextFieldForThisProject(
                  controller: _newPasswordTEController,
                  titleName: 'New Password',
                  hintText: 'New password',
                ),
                SizedBox(height: 16.h),
                TextFieldForThisProject(
                  controller: _reTypepasswordTEController,
                  titleName: 'New Password',
                  hintText: 'Re-type New Password',
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
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                CustomButton(

                  title: 'Update Password',
                  // loading: true,
                  onpress: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: CustomText(
                            text: 'Update password complete',
                            fontWeight: FontWeight.w900,
                            textAlign: TextAlign.start,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    FocusScope.of(context).unfocus();
    _currentPasswordTEController.dispose();
    _newPasswordTEController.dispose();
    _reTypepasswordTEController.dispose();
    super.dispose();
  }
}
