import 'dart:io';

import 'package:community_engaged_app/helpers/image_picker_helper.dart';
import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_photo_picker_bottom_sheet.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/step_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NidPictureScreen extends StatefulWidget {
  const NidPictureScreen({super.key});

  @override
  State<NidPictureScreen> createState() => _NidPictureScreenState();
}

class _NidPictureScreenState extends State<NidPictureScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _frontSideImage;
  File? _backSideImage;
  ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  /// have to take two photo for backside and for front side
  /// from gallery and where the front and back side image will be saved
  void _getImageFromGallery({required bool isFrontSide}) async {
    final pickedImage = await _imagePickerHelper.pickFromGallery();
    if (pickedImage != null) {
      setState(() {
        if (isFrontSide) {
          _frontSideImage = pickedImage;
        } else {
          _backSideImage = pickedImage;
        }
      });
    }
  }

  /// get photo from camera and choose where it will saved the photo front side pic in
  /// front side card and back side  pic in backside card
  Future<void> _getImageFromCamera({required bool isFrontSide}) async {
    final pickedImage = await _imagePickerHelper.pickFromCamera();
    if (pickedImage != null) {
      setState(() {
        if (isFrontSide) {
          _frontSideImage = pickedImage;
        } else {
          _backSideImage = pickedImage;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'NID Picture',
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontsize: 20.sp,
        ),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StepProgressBar(currentStep: 2),
              SizedBox(height: 20.h),
              _takingFrontSideNidPicture(context),
              SizedBox(height: 32.h),
              _takingBackSideNidPicture(context),
              SizedBox(height: 118.h),
              CustomButton(label: 'Next', onPressed: _onTapValidate),
            ],
          ),
        ),
      ),
    );
  }

  Widget _takingBackSideNidPicture(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await customPhotoPickerBottomSheet(
          context: context,
          onGalleryTap: () => _getImageFromGallery(isFrontSide: false),
          onCameraTap: () => _getImageFromCamera(isFrontSide: false),
        );
      },
      child:
          _backSideImage != null
              ? Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    _backSideImage!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              : _uploadNidPictureCard('Upload back side Picture here'),
    );
  }

  GestureDetector _takingFrontSideNidPicture(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await customPhotoPickerBottomSheet(
          context: context,
          onGalleryTap: () => _getImageFromGallery(isFrontSide: true),
          onCameraTap: () => _getImageFromCamera(isFrontSide: true),
        );
      },
      child:
          _frontSideImage != null
              ? Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    _frontSideImage!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              : _uploadNidPictureCard('Upload front side Picture here'),
    );
  }

  ///Custom card for selecting nid picture from front and back
  Widget _uploadNidPictureCard(String name) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE6F6F7),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.primaryColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: Icon(Icons.add, color: AppColor.primaryColor, size: 50),
          ),
          // SizedBox(height: 4.h),
          // Text(name, style: TextStyle(color: Colors.grey)),
          CustomText(text: name, color: Colors.black, fontsize: 16.sp),
        ],
      ),
    );
  }

  void _onTapValidate() {
    if (_frontSideImage != null && _backSideImage != null) {
      Get.toNamed(AppRoutes.takeYourPictureScreen);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your NID card Picture'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
