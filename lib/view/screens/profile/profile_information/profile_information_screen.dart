import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/profile_picture_with_referral%20_code_widget.dart';
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
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Center(child: ProfilePictureWithReferralCodeWidget()),
              SizedBox(height: 16.h),
              TextFieldWithExternalTitle(
                titleName: 'Name',
                readOnly: true,
                hintText: 'Your name',
              ),
              SizedBox(height: 2.h),
              TextFieldWithExternalTitle(
                titleName: 'E-mail',
                readOnly: true,
                hintText: 'example@gmail.com',
              ),
              SizedBox(height: 2.h),
              TextFieldWithExternalTitle(
                titleName: 'Phone No.',
                readOnly: true,
                hintText: '05810-57070',
              ),
              SizedBox(height: 2.h),
              TextFieldWithExternalTitle(
                titleName: 'Address',
                readOnly: true,
                hintText: 'Address',
              ),
              SizedBox(height: 8.h),
              CustomButton(
                label: 'NidFront.jpg',
                onPressed: () {
                  showNidPopUp(context);
                },
                height: 42.h,
              ),
              SizedBox(height: 2.h),
              CustomButton(
                label: 'NidBack.jpg',
                onPressed: () {
                 showNidPopUp(context);
                },
                height: 42.h,
              ),
              SizedBox(height: 32.h),
              CustomButton(
                label: 'Edit Profile',
                onPressed: () {
                  Get.toNamed(AppRoutes.editProfileScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showNidPopUp(BuildContext context) {
    return showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return Center(
                      child: Stack(
                        alignment: Alignment(1.1,-1.10),
                        children: [
                         Container(
                           height: 229.h,
                           width: 327.w,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(16),
                             // boxShadow:[
                             //   BoxShadow(
                             //     color: Colors.grey,
                             //     offset: Offset(0, 2),
                             //     // blurRadius: 2,
                             //     spreadRadius: 2,
                             //   )
                             // ],
                             image: DecorationImage(image: AssetImage(AppImage.tarataniLogoUrl2),fit: BoxFit.contain)
                           ),

                         ),
                          GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.close,color: Colors.red,),
                            ),
                          )
                        ],
                      ),
                    );
                  },
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
