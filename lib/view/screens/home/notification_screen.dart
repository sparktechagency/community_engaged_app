import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(8),
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 35.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        Icon(Icons.notifications,color: AppColor.cardColorE9F2F9,)
                      ],
                    ),
                    title: CustomText(text: 'Confirm Payment',textAlign: TextAlign.start,fontWeight: FontWeight.w700,color: Colors.black,),
                    subtitle: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Your payment is completed',textAlign: TextAlign.start,fontWeight: FontWeight.w500,color: Colors.black,fontsize: 14.sp,),
                        Row(
                          children: [
                            CustomText(text: '10:00am',textAlign: TextAlign.start,fontWeight: FontWeight.w500,color: Colors.black,fontsize: 12.sp,),
                            SizedBox(width: 16.w,),
                            CustomText(text: 'Today',textAlign: TextAlign.start,fontWeight: FontWeight.w500,color: Colors.black,fontsize: 12.sp,),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
