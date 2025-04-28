import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordTEController = TextEditingController();
  final TextEditingController _newPasswordTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password', style: TextStyle(fontWeight: FontWeight.w500)),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Current Password',style: TextStyle(fontSize: 16.sp)),
                    // SizedBox(height: 8.h,),
                    CustomTextField(
                      controller: _currentPasswordTEController,
                      hintText: 'Current Password',
                      isPassword: true,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New Password',style: TextStyle(fontSize: 16.sp)),
                    // SizedBox(height: 8.h,),
                    CustomTextField(
                      controller: _newPasswordTEController,
                      hintText: 'New Password',
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter your new password';
                        }
                        return null;
                      },
                      isPassword: true,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New Password',style: TextStyle(fontSize: 16.sp)),
                    // SizedBox(height: 8.h,),
                    CustomTextField(
                      controller: _passwordTEController,
                      hintText: 'Re-type Current Password',
                      isPassword: true,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please re-type password';
                        }
                        if(value != _newPasswordTEController.text){
                          return 'Password do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.emailVerificationScreen);
                      },
                        child: Text('Forget Password?',style: TextStyle(color: AppColor.textButtonColor,fontWeight: FontWeight.w600),))
                  ],
                ),
                SizedBox(height: 32.h),
                CustomElevatedButtonWidget(
                  buttonName: "Update Password",
                  onTapNext: (){
                    if(_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Change complete')));
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
    _passwordTEController.dispose();
    super.dispose();
  }
}
