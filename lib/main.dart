import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/view/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(CommunityEngagedApp());
}

class CommunityEngagedApp extends StatelessWidget {
  const CommunityEngagedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Community Engaged App",
            home: SplashScreen(),
            initialRoute: AppRoutes.splashScreen,
            getPages: AppRoutes.routes,
          ),
    );
  }
}
