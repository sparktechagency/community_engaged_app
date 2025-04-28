import 'dart:io';

import 'package:community_engaged_app/helpers/image_picker_helper.dart';
import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_pop_up_widget.dart';
import 'package:community_engaged_app/view/widgets/step_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
        title: Text(
          'Take Your Picture',
          style: TextStyle(fontWeight: FontWeight.w500),
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
                backgroundImage: _image != null ? FileImage(_image!) : null,
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.only(left: 68, right: 68),
                child: CustomElevatedButtonWidget(
                  buttonName: 'Take Picture',
                  onTapNext: () {
                    showModalBottomSheet<void>(
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
                                    _getPhotoFromGallery();
                                  },
                                ),
                                Divider(),
                                TextButton(
                                  child: const Text('Camera'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _getPhotoFromCamera();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 150.h),
              CustomElevatedButtonWidget(
                buttonName: 'Sign Up',
                onTapNext: () async {
                  bool? result = await customPopUpWidget(
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

  // void _showReferralDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         actionsAlignment: MainAxisAlignment.spaceEvenly,
  //         alignment: Alignment.center,
  //         title: Text(
  //           "Complete SignUp!",
  //           style: TextStyle(color: AppColor.themeColor),
  //         ),
  //         content: Text("Do you want to SignUp with Referral code?"),
  //         actions: [
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               // fixedSize: Size(25, 15)
  //               side: BorderSide(color: AppColor.themeColor)
  //             ),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               Get.toNamed(AppRoutes.addReferralCodeScreen);
  //             },
  //             child: Text("Yes", style: TextStyle(color: AppColor.themeColor)),
  //           ),
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               // fixedSize: Size(25, 15)
  //               //   side: BorderSide(color: AppColor.themeColor)
  //               backgroundColor: AppColor.textButtonColor,
  //               foregroundColor: AppColor.cardColorE9F2F9,
  //             ),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text(
  //               "No",
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
