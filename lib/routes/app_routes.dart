
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

  ];
}