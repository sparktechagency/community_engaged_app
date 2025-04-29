import 'dart:io';

import 'package:community_engaged_app/helpers/image_picker_helper.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_photo_picker_bottom_sheet.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/custom_text_field.dart';
import 'package:community_engaged_app/view/widgets/text_field_for_this_project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();

  File? _updatePic;
  ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  Future<void> _getPhotoFromGallery() async {
    final image = await _imagePickerHelper.pickFromGallery();
    if (image != null) {
      setState(() {
        _updatePic = image;
      });
    }
  }

  Future<void> _getPhotoFromCamera() async {
    final image = await _imagePickerHelper.pickFromCamera();
    if (image != null) {
      setState(() {
        _updatePic = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Edit Profile',
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
              SizedBox(height: 16.h),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          _updatePic != null
                              ? FileImage(_updatePic!)
                              : AssetImage(AppImage.splashScreenLogo),
                    ),
                    GestureDetector(
                      onTap: () {
                        customPhotoPickerBottomSheet(
                          context: context,
                          onGalleryTap: () => _getPhotoFromGallery(),
                          onCameraTap: () => _getPhotoFromGallery(),
                        );
                      },
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        // color: AppColor.cardColorE9F2F9,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),

              TextFieldForThisProject(
                titleName: 'Your Name',
                hintText: 'Your Name',
                controller: _nameTEController,
              ),
              SizedBox(height: 2.h),

              TextFieldForThisProject(
                titleName: 'E-mail',
                hintText: 'email address',
                controller: _emailTEController,
              ),

              SizedBox(height: 2.h),
              TextFieldForThisProject(
                titleName: 'Phone No.',
                hintText: '2058210-09715097',
                controller: _phoneTEController,
              ),

              SizedBox(height: 2.h),
              TextFieldForThisProject(
                titleName: 'Address',
                hintText: 'address',
                controller: _addressTEController,
              ),

              SizedBox(height: 8.h),
              _buttonForUploadNid('NID Front.'),
              SizedBox(height: 8.h),
              _buttonForUploadNid('NID Back.'),

              SizedBox(height: 32.h),

              CustomElevatedButtonWidget(
                buttonName: 'Update',
                onTapNext: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonForUploadNid(String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: TextStyle(fontSize: 16.sp)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            backgroundColor: AppColor.themeColor,
            foregroundColor: AppColor.cardColorE9F2F9,
          ),
          onPressed: () {},
          child: Icon(Icons.upload, size: 30),
        ),
      ],
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
