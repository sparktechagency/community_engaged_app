import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedIndex =0;
  final List<Widget> _screens =[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32), // <-- Clip the NavigationBar itself
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.r,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: NavigationBar(
              height: 70,
              backgroundColor: AppColor.themeColor,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              // animationDuration:Duration(seconds: 1) ,
              // indicatorShape: CircleBorder(eccentricity: .1),
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: [
                NavigationDestination(icon: Icon(Icons.home_outlined,size: 25.h,color: _selectedIndex ==0 ? AppColor.themeColor : Colors.black,), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.support_agent_outlined,size: 25.h,color: _selectedIndex ==1 ? AppColor.themeColor : Colors.black), label: 'Support'),
                NavigationDestination(icon: Icon(Icons.person_outline,size: 25.h,color: _selectedIndex ==2 ? AppColor.themeColor : Colors.black), label: 'Profile'),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
