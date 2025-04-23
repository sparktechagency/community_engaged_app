import 'package:community_engaged_app/view/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes{
  static const  String splashScreen ="/splash-screen";

  static List<GetPage> get routes => [
    GetPage(name: splashScreen, page: () => SplashScreen()),

  ];
}