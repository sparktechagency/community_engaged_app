import 'package:community_engaged_app/helpers/url_launcher_helper.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  _makingPhoneCall() async {
    var _url = Uri.parse("tel:01784567684");
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Support',
          fontsize: 22.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Image.asset(
                  AppImage.supportImageUrl,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  height: 200.h,
                  width: 200.w,
                ),
                SizedBox(height: 16.h),
                Stack(
                  alignment: Alignment(0, -1.29),
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      height: 123.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColor.primaryColor,
                          width: 3,
                        ),
                      ),
                      child: CustomText(
                        text:
                            "If you have any questions, need assistance, or want to discuss your progress, feel free to reach out to your coach. We're here to help you achieve your fitness goals!",
                        fontsize: 15.sp,
                        textAlign: TextAlign.start,
                        textOverflow: TextOverflow.fade,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          CustomText(
                            text: 'Support',
                            fontsize: 22.sp,
                            fontWeight: FontWeight.bold,
                            // color: Colors.black,
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: 77.h,
                  width: 267.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    color: AppColor.primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.call, color: AppColor.cardColorE9F2F9),
                            SizedBox(width: 16.w),
                            GestureDetector(
                              onTap:()=> makingPhoneCall('01784567684'),
                              child: CustomText(
                                text: '01784567684',
                                fontsize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.mail, color: AppColor.cardColorE9F2F9),
                            SizedBox(width: 16.w),
                            GestureDetector(
                              onTap: (){
                                makingEmailCall('shofiqur7684@gmail.com');
                              },
                              child: CustomText(
                                text: 'shofiqur7684@gmail.com',
                                decoration: TextDecoration.underline,
                                fontsize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
