import 'dart:io';

import 'package:community_engaged_app/helpers/image_picker_helper.dart';
import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_photo_picker_bottom_sheet.dart';
import 'package:community_engaged_app/view/widgets/custom_pop_up_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/step_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TakeYourPictureScreen extends StatefulWidget {
  const TakeYourPictureScreen({super.key});

  @override
  State<TakeYourPictureScreen> createState() => _TakeYourPictureScreenState();
}

class _TakeYourPictureScreenState extends State<TakeYourPictureScreen> {
  File? _image;
  ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  void _getPhotoFromGallery() async {
    final image = await _imagePickerHelper.pickFromGallery();
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  void _getPhotoFromCamera() async {
    final image = await _imagePickerHelper.pickFromCamera();
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Take Your Picture',
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontsize: 20,
        ),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              StepProgressBar(currentStep: 3),
              SizedBox(height: 20.h),
              CircleAvatar(
                radius: 80.r,
                backgroundColor: _image == null ? Colors.grey : null,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child:_image ==null? Icon(Icons.person,size: 140.r,color: Colors.white,) : null,
              ),
              SizedBox(height: 20.h),
              CustomButton(
                title: 'Take Picture',
                onpress: () {
                  customPhotoPickerBottomSheet(
                    context: context,
                    onGalleryTap: _getPhotoFromGallery,
                    onCameraTap: _getPhotoFromCamera,
                  );
                },
                width: 200.w,
              ),
              SizedBox(height: 238.h),
              CustomButton(
                title: 'Sign Up',
                onpress: () async {
                  await customPopUpWidget(
                    context: context,
                    title: 'Complete Signup',
                    subtitle: 'Do you want to Signup with Referral code?',
                    firstButton: 'Yes',
                    lastButton: 'No',
                    onPressedFirstButton: () {
                      Get.toNamed(AppRoutes.addReferralCodeScreen);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
