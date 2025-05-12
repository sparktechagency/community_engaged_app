import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/routes/export.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    Future.delayed(Duration(seconds: 3),(){
      Get.offAllNamed(AppRoutes.splashScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Center(child: AppLogo()),
            CircularProgressIndicator(color: AppColor.primaryColor,),
            SizedBox(height: 16.h),
          ],
        ),
      ),
      // backgroundColor: AppColor.primaryColor,
    );
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
