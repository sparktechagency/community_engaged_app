import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Your Picture', style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StepProgressBar(currentStep: 3),
            SizedBox(height: 20.h,),
            CircleAvatar(radius: 80.r,),
            SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.only(left: 68, right: 68),
              child: CustomElevatedButtonWidget(buttonName: 'Take Picture', onTapNext: (){}),
            ),
            SizedBox(height: 150.h,),
            CustomElevatedButtonWidget(buttonName: 'Sign Up', onTapNext:(){
              _showReferralDialog(context);
            }),

          ],
        ),
      ),
    );
  }
  void _showReferralDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Complete Signup",style: TextStyle(color: AppColor.themeColor),),
          content: Text("Do you want to signup with Referral code?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Get.toNamed(AppRoutes.addReferralCodeScreen);
              },
              child: Text("Yes",style: TextStyle(color: AppColor.themeColor),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No",style: TextStyle(color: AppColor.textButtonColor),),
            ),
          ],
        );
      },
    );
  }

}
