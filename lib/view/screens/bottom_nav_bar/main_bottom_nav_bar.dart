import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/routes/export.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SupportScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.r, right: 24.r),
          child: Container(
            height: 60.h,
            width: double.infinity,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(54.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (index) {
                final bool isSelected = _selectedIndex == index;
                // Dynamic icon for selecting terms and conditions
                final iconPath =
                    index == 0
                        ? AppImage.homeIconUrl
                        : index == 1
                        ? AppImage.supportIconUrl
                        : AppImage.profileIconUrl;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 50.r,
                    height: 50.r,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        iconPath,
                        color:
                            isSelected ? AppColor.primaryColor : Colors.white,
                        width: 28.w,
                        height: 28.h,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
