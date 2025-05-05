import 'package:community_engaged_app/routes/app_routes.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/screens/splash_screen/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(
    DevicePreview(enabled: false, builder: (context) => CommunityEngagedApp()),
  );
}

class CommunityEngagedApp extends StatelessWidget {
  const CommunityEngagedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) => child!,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Community Engaged App",
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
        home: SplashScreen(),
        initialRoute: AppRoutes.loadingScreen,
        getPages: AppRoutes.routes,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.appColor,
          appBarTheme: AppBarTheme(

            color: Colors.white,
            scrolledUnderElevation: 0,
          ),
        ),
        localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      ),
    );
  }
}
