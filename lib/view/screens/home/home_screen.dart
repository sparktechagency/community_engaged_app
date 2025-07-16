import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_app_bar_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_button.dart';
import 'package:community_engaged_app/view/widgets/custom_mini_card_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:community_engaged_app/view/widgets/month_year_picker.dart';
import 'package:community_engaged_app/view/widgets/profile_picture_with_referral%20_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  void _onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfilePictureWithReferralCodeWidget(showReferralCode: true),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: CustomText(
                            text: 'Shofiqur Rahman Soyon',
                            textOverflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            fontsize: 22.sp,
                            maxline: 5,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        CustomButton(
                          onPressed: () {},
                          label: "Donate Now",
                          height: 38.h,
                          width: 159.w,
                        ),
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //     textStyle: TextStyle(
                        //       fontSize: 16.h,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //     backgroundColor: AppColor.primaryColor,
                        //     foregroundColor: Colors.white,
                        //   ),
                        //   onPressed: () {},
                        //   child: CustomText(
                        //     text: ,
                        //     color: Colors.white,
                        //     fontsize: 17.sp,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              ///<<<<<<<<<Profile Bio Card>>>>>>>>>>>>>
              _cardForProfileBio(),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomMiniCardWidget(
                    context: context,
                    cardTitle: 'Available Balance',
                    cardSubtitle: '\$2350',
                    buttonName: 'Withdraw Now',
                    onTap: () {},
                  ),
                  CustomMiniCardWidget(
                    context: context,
                    cardTitle: 'Referral Users',
                    cardSubtitle: '52',
                    buttonName: 'See All',
                    onTap: () {
                      Get.toNamed(AppRoutes.referralUserScreen);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Overview',
                    fontsize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                  GestureDetector(
                    onTap: () async {
                      showCustomMonthYearPicker(
                        context: context,
                        onSelected: _onDateSelected,
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: AppColor.primaryColor,
                        ),
                        CustomText(
                          text: DateFormat('MMMM yyyy').format(selectedDate),
                          fontsize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              _cardForMonthlyPayHistory(),
            ],
          ),
        ),
      ),
    );
  }

  ///create a custom card for show user payment history
  ///payment data status and amount and added calender using month_year_picker
  ///for selecting month if select month card will show those month
  ///payment history
  Widget _cardForMonthlyPayHistory() {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center, // align vertically
              children: [
                CustomText(
                  text: 'Payment Date',
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                ),
                CustomText(
                  text: 'Status',
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                ),
                CustomText(
                  text: 'Amount',
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                ),
              ],
            ),
            Divider(),
            ListView.separated(
              shrinkWrap: true,
              // allow ListView inside Column
              physics: NeverScrollableScrollPhysics(),
              // disable inner scrolling
              itemCount: 5,
              // or any dynamic value
              separatorBuilder: (context, index) => Divider(color: Colors.grey),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: '27-04-25',
                        fontWeight: FontWeight.w600,
                        fontsize: 12.sp,
                        color: AppColor.primaryColor,
                      ),
                      CustomText(
                        text: 'complete',
                        fontWeight: FontWeight.w600,
                        fontsize: 12.sp,
                        color: AppColor.primaryColor,
                      ),
                      CustomText(
                        text: '2000xOF',
                        fontWeight: FontWeight.w600,
                        fontsize: 12.sp,
                        color: AppColor.primaryColor,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ///custom card for show user bio and it static for all user
  Container _cardForProfileBio() {
    return Container(
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [AppColor.primaryColor, Color(0xffD4E7B8)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: CustomText(
                text: 'Referral more, earn more...',
                fontsize: 23.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(0, 2),
                    blurRadius: 3,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

            SizedBox(height: 8.h),
            SvgPicture.asset(
              AppImage.verticalLogoUrl,
              height: 3.h,
              width: 105.w,
              color: Colors.black,
            ),
            SizedBox(height: 8.h),
            Flexible(
              child: CustomText(
                text:
                    'Join us in creating a brighter future. Your donations empower those in need, bringing hope and change to lives.',
                textAlign: TextAlign.start,
                textOverflow: TextOverflow.fade,
                fontsize: 14.sp,
                color: Colors.white,
                // fontWeight: FontWeight.w40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
