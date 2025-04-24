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
              _uploadNidPictureCard('Upload font side Picture here'),
              SizedBox(height: 20.h),
              _uploadNidPictureCard('Upload back side Picture here'),
              SizedBox(height: 32.h),
              CustomElevatedButtonWidget(buttonName: 'Next', onTapNext: () {
                Get.toNamed(AppRoutes.takeYourPictureScreen);
              }),
            ],
          ),
        ),
      ),
    );
  }

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
