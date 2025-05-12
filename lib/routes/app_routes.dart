import 'export.dart';

class AppRoutes {
  static const String splashScreen = "/splash-screen";
  static const String signInScreen = "/sign-in-screen";
  static const String signUpScreen = "/sign-up-screen";
  static const String emailVerificationScreen = "/email-verification-screen";
  static const String otpVerificationScreen = "/otp-verification-screen";
  static const String resetPasswordScreen = "/reset-password-screen";
  static const String nidPictureScreen = "/nid-picture-screen";
  static const String takeYourPictureScreen = "/take-your-picture-screen";
  static const String addReferralCodeScreen = "/add-referral-code-screen";
  static const String mainBottomNavBarScreen = "/bottom-nav-bar-screen";
  static const String homeScreen = "/home-screen";
  static const String referralUserScreen = "/referral-user-screen";
  static const String supportScreen = "/support-screen";
  static const String notificationScreen = "/notification-screen";
  static const String profileScreen = "/profile-screen";
  static const String profileInformationScreen = "/profile-information-screen";
  static const String editProfileScreen = "/edit-profile-screen";
  static const String settingScreen = "/setting-screen";
  static const String changePasswordScreen = "/change-password-screen";
  static const String privacyPolicyScreen = "/privacy-policy-screen";
  static const String termsOfServiceScreen = "/terms-of-service-screen";
  static const String aboutUsScreen = "/about-us-screen";
  static const String loadingScreen = "/loading-screen";

  static List<GetPage> get routes => [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: otpVerificationScreen,
      page: () => OtpVerificationScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: emailVerificationScreen,
      page: () => EmailVerificationScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: nidPictureScreen,
      page: () => NidPictureScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: takeYourPictureScreen,
      page: () => TakeYourPictureScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: addReferralCodeScreen,
      page: () => AddReferralCodeScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: mainBottomNavBarScreen,
      page: () => MainBottomNavBarScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: referralUserScreen,
      page: () => ReferralUsersScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(name: supportScreen, page: () => SupportScreen()),
    GetPage(
      name: notificationScreen,
      page: () => NotificationScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: profileInformationScreen,
      page: () => ProfileInformationScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: settingScreen,
      page: () => SettingsScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: changePasswordScreen,
      page: () => ChangePasswordScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: termsOfServiceScreen,
      page: () => TermsOfServiceScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: aboutUsScreen,
      page: () => AboutUsScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: loadingScreen,
      page: () => LoadingScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}
