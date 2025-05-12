import 'dart:io';

import 'package:community_engaged_app/helpers/image_picker_helper.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_photo_picker_bottom_sheet.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/profile_picture_with_referral%20_code_widget.dart';
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
  File? _nidFrontPic;
  File? _nidBackPic;
  ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  Future<void> _getPhotoFromGallery(String type) async {
    final image = await _imagePickerHelper.pickFromGallery();
    if (image != null) {
      setState(() {
        if (type == 'front') {
          _nidFrontPic = image;
        } else if (type == 'back') {
          _nidBackPic = image;
        } else {
          _updatePic = image;
        }
      });
    }
  }

  Future<void> _getPhotoFromCamera(String type) async {
    final image = await _imagePickerHelper.pickFromCamera();
    if (image != null) {
      setState(() {
        if (type == 'front') {
          _nidFrontPic = image;
        } else if (type == 'back') {
          _nidBackPic = image;
        } else {
          _updatePic = image;
        }
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
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ProfilePictureWithReferralCodeWidget(
                      child: ClipOval(
                        child:
                            _updatePic != null
                                ? Image.file(
                                  _updatePic!,
                                  width: 97.w,
                                  height: 97.h,
                                  fit: BoxFit.cover,
                                )
                                : Image.asset(
                                  AppImage.splashScreenLogo,
                                  width: 90.w,
                                  height: 90.h,
                                  fit: BoxFit.cover,
                                ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        customPhotoPickerBottomSheet(
                          context: context,
                          onGalleryTap: () => _getPhotoFromGallery('profile'),
                          onCameraTap: () => _getPhotoFromCamera('profile'),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.1),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(200.r),
                            bottomRight: Radius.circular(200.r),
                          ),
                        ),
                        height: 39.h,
                        width: 88.w,
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),

              TextFieldWithExternalTitle(
                titleName: 'Your Name',
                hintText: 'Your Name',
                controller: _nameTEController,
              ),
              SizedBox(height: 2.h),

              TextFieldWithExternalTitle(
                titleName: 'E-mail',
                hintText: 'email address',
                controller: _emailTEController,
              ),

              SizedBox(height: 2.h),
              TextFieldWithExternalTitle(
                titleName: 'Phone No.',
                hintText: '2058210-09715097',
                controller: _phoneTEController,
              ),

              SizedBox(height: 2.h),
              TextFieldWithExternalTitle(
                titleName: 'Address',
                hintText: 'address',
                controller: _addressTEController,
              ),

              SizedBox(height: 8.h),
              NidPicUploadButton(
                title: 'NID Front.',
                onTap: () {
                  customPhotoPickerBottomSheet(
                    context: context,
                    onGalleryTap: () => _getPhotoFromGallery('front'),
                    onCameraTap: () => _getPhotoFromCamera('front'),
                  );
                },
                child: Center(
                  child: _nidFrontPic !=null ?Text(_nidFrontPic!.path) : Icon(Icons.upload, size: 30),
                ),
              ),
              SizedBox(height: 8.h),
              NidPicUploadButton(
                title: 'NID Back.',
                onTap: () {
                  customPhotoPickerBottomSheet(
                    context: context,
                    onGalleryTap: () => _getPhotoFromGallery('back'),
                    onCameraTap: () => _getPhotoFromCamera('back'),
                  );
                },
                child: Center(
                  child: _nidBackPic !=null ?Text(_nidBackPic!.path) : Icon(Icons.upload, size: 30),
                ),
              ),
              SizedBox(height: 32.h),
              CustomButton(
                title: 'Update',
                onpress: () {},
                width: double.infinity,
              ),
              SizedBox(height: 32.h),
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

class NidPicUploadButton extends StatelessWidget {
  const NidPicUploadButton({super.key, required this.title, this.onTap,  this.child});

  final String title;
  final Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16.sp)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            backgroundColor: AppColor.primaryColor,
            foregroundColor: AppColor.cardColorE9F2F9,
          ),
          onPressed: onTap,
          child:child,
        ),
      ],
    );
  }
}
