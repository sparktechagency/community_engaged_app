import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_app_bar_widget.dart';
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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CustomText(
                          text: 'Mohammed-Intellu',
                          fontsize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w500,
                          ),
                          backgroundColor: AppColor.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: CustomText(
                          text: 'Donate Now',
                          color: Colors.white,
                          fontsize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                  ),
                  GestureDetector(
                    onTap: () async {
                      showCustomMonthYearPicker(context: context,onSelected: _onDateSelected);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: AppColor.primaryColor,
                        ),
                        CustomText(
                          text:'${DateFormat('MMMM yyyy').format(selectedDate)}',
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
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color(0xffEAF4DD),
            spreadRadius: 2,
            // blurRadius: 5,
            offset: Offset(1, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Payment Date',
                  fontsize: 14,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: 'Status',
                  fontsize: 14,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: 'Amount',
                  fontsize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Divider(),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder:
                    (context, index) =>
                        Divider(color: Colors.grey, thickness: 1),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: '27-04-25',
                          fontWeight: FontWeight.w600,
                          fontsize: 14,
                        ),
                        CustomText(
                          text: 'complete',
                          fontWeight: FontWeight.w600,
                          fontsize: 14,
                        ),
                        CustomText(
                          text: '2000xOF',
                          fontWeight: FontWeight.w600,
                          fontsize: 14,
                        ),
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
            CustomText(
              text: 'Referral more, earn more...',
              fontsize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),

            SizedBox(height: 8.h),
            SvgPicture.asset(
              AppImage.verticalLogoUrl,
              height: 3.h,
              width: 105.w,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text:
                  'Join us in creating a brighter future. Your donations empower those in need, bringing hope and change to lives.',
              textAlign: TextAlign.start,
              textOverflow: TextOverflow.fade,
              fontsize: 17.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
