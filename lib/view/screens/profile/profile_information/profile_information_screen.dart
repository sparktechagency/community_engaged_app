import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/text_field_for_this_project.dart';
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
        title: CustomText(
          text: 'Profile Information',
          fontsize: 22.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
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
              TextFieldForThisProject(titleName: 'Name', hintText: 'Your name'),
              SizedBox(height: 2.h),

              TextFieldForThisProject(titleName: 'E-mail', hintText: 'example@gmail.com'),

              SizedBox(height: 2.h),

              TextFieldForThisProject(titleName: 'Phone No.', hintText: '05810-57070'),
              SizedBox(height: 2.h),
              TextFieldForThisProject(titleName: 'Address', hintText: 'flkjasohtfoih address'),

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
