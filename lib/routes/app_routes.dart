
import 'package:community_engaged_app/view/screens/bottom_nav_bar/main_bottom_nav_bar.dart';
import 'package:community_engaged_app/view/screens/home/home_screen.dart';

import 'export.dart';

class AppRoutes{
  static const  String splashScreen ="/splash-screen";
  static const  String signInScreen ="/sign-in-screen";
  static const  String signUpScreen ="/sign-up-screen";
  static const  String emailVerificationScreen ="/email-verification-screen";
  static const  String otpVerificationScreen ="/otp-verification-screen";
  static const  String resetPasswordScreen ="/reset-password-screen";
  static const  String nidPictureScreen ="/nid-picture-screen";
  static const  String takeYourPictureScreen ="/take-your-picture-screen";
  static const  String addReferralCodeScreen ="/add-referral-code-screen";
  static const  String mainBottomNavBarScreen ="/bottom-nav-bar-screen";
  static const  String homeScreen ="/home-screen";

  static List<GetPage> get routes => [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: otpVerificationScreen, page: () => OtpVerificationScreen()),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
    GetPage(name: emailVerificationScreen, page: () => EmailVerificationScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: nidPictureScreen, page: () => NidPictureScreen()),
    GetPage(name: takeYourPictureScreen, page: () => TakeYourPictureScreen()),
    GetPage(name: addReferralCodeScreen, page: () => AddReferralCodeScreen()),
    GetPage(name: mainBottomNavBarScreen, page: () => MainBottomNavBarScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),

  ];
}