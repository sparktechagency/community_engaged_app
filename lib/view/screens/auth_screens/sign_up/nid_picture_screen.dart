import 'dart:io';

import 'package:community_engaged_app/helpers/image_picker_helper.dart';
import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/step_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NidPictureScreen extends StatefulWidget {
  const NidPictureScreen({super.key});

  @override
  State<NidPictureScreen> createState() => _NidPictureScreenState();
}

class _NidPictureScreenState extends State<NidPictureScreen> {
  File? _frontSideImage;
  File? _backSideImage;
  ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  /// have to take two photo for backside and for front side
  /// from gallery and where the front and back side image will be saved
  void _getImageFromGallery({required bool isFrontSide}) async {
    final pickedImage = await _imagePickerHelper.pickFromGallery();
    if (pickedImage != null) {
      setState(() {
        if(isFrontSide){
          _frontSideImage = pickedImage;
        }else{
          _backSideImage = pickedImage;
        }
      });
    }
  }

  /// get photo from camera and choose where it will saved the photo front side pic in
  /// front side card and back side  pic in backside card
  Future<void> _getImageFromCamera({required bool isFrontSide}) async {
    final pickedImage = await _imagePickerHelper.pickFromCamera();
    if(pickedImage != null){
      setState(() {
        if(isFrontSide){
          _frontSideImage = pickedImage;
        }else{
          _backSideImage = pickedImage;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NID Picture',
          style: TextStyle(fontWeight: FontWeight.w500),
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
              SizedBox(height: 20.h),
              _takingBackSideNidPicture(context),
              SizedBox(height: 32.h),
              CustomElevatedButtonWidget(
                buttonName: 'Next',
                onTapNext: () {
                  Get.toNamed(AppRoutes.takeYourPictureScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _takingBackSideNidPicture(BuildContext context) {
    return GestureDetector(
              onTap: () {
                onTapPickImageSource(context,isFrontSide: false);
              },
              child:
              _backSideImage != null
                  ? Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.file(
                  _backSideImage!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
                  : _uploadNidPictureCard(
                'Upload back side Picture here',
              ),
            );
  }

  GestureDetector _takingFrontSideNidPicture(BuildContext context) {
    return GestureDetector(
              onTap: () {
                onTapPickImageSource(context,isFrontSide: true);
              },
              child:
                  _frontSideImage != null
                      ? Container(
                    height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.file(
                          _frontSideImage!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                      : _uploadNidPictureCard(
                        'Upload font side Picture here',
                      ),
            );
  }

  ///Pick image source from gallery and camera
  ///setting logic where the picture will go in front side or in back side
  Future<void> onTapPickImageSource(BuildContext context,{required bool isFrontSide}) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                  child: const Text('Gallery'),
                  onPressed: () {
                    Navigator.pop(context);
                    _getImageFromGallery(isFrontSide: isFrontSide);
                  },
                ),
                Divider(),
                TextButton(
                  child: const Text('Camera'),
                  onPressed: () {
                    Navigator.pop(context);
                    _getImageFromCamera(isFrontSide: isFrontSide);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///Custom card for selecting nid picture from front and back
  Widget _uploadNidPictureCard(String name) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.themeColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: AppColor.themeColor, size: 50),
          SizedBox(height: 4.h),
          Text(name, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
