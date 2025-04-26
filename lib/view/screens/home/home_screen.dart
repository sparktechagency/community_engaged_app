import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/profile_picture_with_referral%20_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: 25.h,
                color: AppColor.themeColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
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
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 150.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: SvgPicture.asset(
                        AppImage.customCard,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Available Balance',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white),),
                        Text('\$2350',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                        SizedBox(height: 20.h,),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Text('Withdraw Now',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color:AppColor.themeColor),),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 150.h,
                        width: 150.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: SvgPicture.asset(
                          AppImage.customCard,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Available Balance',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white),),
                          Text('\$2350',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                          SizedBox(height: 20.h,),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                            ),
                            child: Text('Withdraw Now',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color:AppColor.themeColor),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
