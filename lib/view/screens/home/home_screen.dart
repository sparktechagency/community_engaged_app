import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/profile_picture_with_referral%20_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? _selectedDate;

  Future<void> monthPicker() async {
    final pickedDate = await showMonthYearPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(DateTime.now().year, DateTime.now().month +1),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24, top: 16),
          child: SvgPicture.asset(AppImage.homeLogo, fit: BoxFit.contain),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 8),
            child: IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.notificationScreen);
              },
              icon: Stack(
                alignment: Alignment(1,-1.5),
                children: [
                  Icon(
                    Icons.notifications,
                    size: 30.h,
                    color: AppColor.themeColor,
                  ),
                  Container(
                    width: 20.w,
                    decoration: BoxDecoration(
                      color: AppColor.textButtonColor,
                      shape: BoxShape.circle
                    ),
                    child: Text('01',style: TextStyle(color: AppColor.cardColorE9F2F9),),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfilePictureWithReferralCodeWidget(),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          'Mohammed-Intellu',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColor.themeColor,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w500,
                          ),
                          backgroundColor: AppColor.themeColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: Text('Donate Now'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              _cardForProfileBio(),
              SizedBox(height: 16.h),
              Row(
                children: [
                  _customCardForBalance(),
                  SizedBox(width: 8.w),
                  Expanded(child: _customCardForRefUser()),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor.themeColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      monthPicker();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: AppColor.themeColor,
                        ),
                        Text(
                          _selectedDate == null
                              ? DateFormat('MMMM').format(DateTime.now()) // Show current month
                              : DateFormat('MMMM').format(_selectedDate!),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.themeColor,
                          ),
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
                    color: Colors.black.withOpacity(.1),
                    spreadRadius: 2,
                    // blurRadius: 5,
                    offset: Offset(1, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Payment Date',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColor.themeColor),),
                        Text('Status',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColor.themeColor),),
                        Text('Amount',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColor.themeColor),),
                      ],
                    ),
                    Divider(),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 5,
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '27-04-25',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.themeColor),
                                ),
                                Text(
                                  'complete',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.themeColor),
                                ),
                                Text(
                                  '2000xOF',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.themeColor),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )

                  ],
                ),
              ),
            );
  }

  ///made a custom card using svg picture for showing referral users add elevated button to show all users
  Stack _customCardForRefUser() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 140.h,
          width: 140.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: SvgPicture.asset(AppImage.customCard, fit: BoxFit.fill),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Referral Users',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              '52',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              alignment: Alignment.center,
              height: 40.h,
              width: 110.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.referralUserScreen);
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: AppColor.themeColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  ///made a custom card for show balance and added withdraw button for cashout balance
  Stack _customCardForBalance() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 140.h,
          width: 150.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: SvgPicture.asset(AppImage.customCard, fit: BoxFit.fill),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Available Balance',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              '\$2350',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Withdraw Now',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColor.themeColor,
                ),
              ),
            ),
          ],
        ),
      ],
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
          colors: [AppColor.themeColor, AppColor.primaryColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Referral more, earn more....',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            Image.asset(
              AppImage.splashScreenVerticalLineLogo,
              alignment: Alignment.centerLeft,
              height: 10,
            ),
            SizedBox(height: 8.h),
            Text(
              'Join us in creating a brighter future. Your donations empower those in need, bringing hope and change to lives.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
