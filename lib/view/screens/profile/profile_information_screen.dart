import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInformationScreen extends StatefulWidget {
  const ProfileInformationScreen({super.key});

  @override
  State<ProfileInformationScreen> createState() =>
      _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Information',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(AppImage.splashScreenLogo),
                ),
              ),
              SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Name', style: TextStyle(fontSize: 16.sp)),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    controller: _nameTEController,
                    readOnly: true,
                    hintText: 'Your name',
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('E-mail', style: TextStyle(fontSize: 16.sp)),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    controller: _emailTEController,
                    readOnly: true,
                    hintText: 'example@gmail.com',
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone No.', style: TextStyle(fontSize: 16.sp)),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    controller: _phoneTEController,
                    readOnly: true,
                    hintText: '193487-49128',
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Address', style: TextStyle(fontSize: 16.sp)),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    controller: _addressTEController,
                    readOnly: true,
                    hintText: 'USA, New York, Post Code-2323',
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              CustomElevatedButtonWidget(buttonName: 'NidFront.pdf', onTapNext: (){}),
              SizedBox(height: 2.h),
              CustomElevatedButtonWidget(buttonName: 'NidBack.pdf', onTapNext: (){}),
              SizedBox(height: 32.h,),
              CustomElevatedButtonWidget(buttonName: 'Edit Profile', onTapNext: (){
                Get.toNamed(AppRoutes.editProfileScreen);
              })
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _nameTEController.dispose();
    _emailTEController.dispose();
    _phoneTEController.dispose();
    _addressTEController.dispose();
    super.dispose();
  }
}
