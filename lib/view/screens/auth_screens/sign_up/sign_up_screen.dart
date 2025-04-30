import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/step_progress_bar.dart';
import 'package:community_engaged_app/view/widgets/text_field_for_this_project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                TextFieldForThisProject(
                  controller: _nameTEController,
                  titleName: 'Your Name',
                  hintText: 'Name',
                ),
                SizedBox(height: 8.h),

                TextFieldForThisProject(
                  controller: _phoneTEController,
                  titleName: 'Phone',
                  hintText: 'Phone Number',
                ),
                SizedBox(height: 8.h),

                TextFieldForThisProject(
                  controller: _emailTEController,
                  titleName: 'E-mail',
                  hintText: 'Email address',
                ),
                SizedBox(height: 8.h),

                TextFieldForThisProject(
                  controller: _passwordTEController,
                  titleName: 'Password',
                  hintText: 'Password',
                ),
                SizedBox(height: 18.h),

                TextFieldForThisProject(
                  controller: _addressTEController,
                  titleName: 'Address',
                  hintText: 'Your address',
                ),
                SizedBox(height: 40.h),
                CustomButton(
                  title: 'Confirm',
                  onpress: () => Get.toNamed(AppRoutes.nidPictureScreen),
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
