import 'package:crowdless/screens/1_greeting_screen/greeting_screen.dart';
import 'package:crowdless/screens/2_onboarding/onboarding.dart';
import 'package:crowdless/screens/3_login/login.dart';
import 'package:crowdless/screens/4_forgot_pass/forgot_pass.dart';
import 'package:crowdless/screens/5_signup_page/signup_page.dart';
import 'package:crowdless/screens/customer_screens/1_home_screen/customer_homescreen.dart';
import 'package:crowdless/screens/customer_screens/2_scan_qr/scan_qr.dart';
import 'package:crowdless/screens/customer_screens/3_view_visits/view_visits.dart';
import 'package:crowdless/screens/merchant_screens/1_merchant_homescreen/merchant_homescreen.dart';
import 'package:crowdless/screens/merchant_screens/2/generate_qr.dart';

import 'package:flutter/material.dart';

// route names here
const String greetingScreen = 'greetingScreen';
const String onbordingScreen = 'onboardingScreen';
const String loginPage = 'loginPage';
const String forgotPass = 'forgotPass';
const String signUpPage = 'signUpPage';
const String customerHomePage = 'customerHomePage';
const String merchantHomePage = 'merchantHomePage';
const String scanQRPage = 'scanQRPage';
const String viewVists = 'viewVisits';
const String generateQR = 'genearteQR';

// control route page flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case greetingScreen:
      return MaterialPageRoute(builder: (context) => const GreetingScreen());

    case onbordingScreen:
      return MaterialPageRoute(builder: (context) => const OnboardingPage());

    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());

    case forgotPass:
      return MaterialPageRoute(builder: (context) => const ForgotPassword());

    case signUpPage:
      return MaterialPageRoute(builder: (context) => const SignUpPage());

    case customerHomePage:
      return MaterialPageRoute(
          builder: (context) => const CustomerHomeScreen());

    case merchantHomePage:
      return MaterialPageRoute(builder: (context) => const MercantHomeScreen());

    case scanQRPage:
      return MaterialPageRoute(builder: (context) => const ScanQRPage());

    case viewVists:
      return MaterialPageRoute(builder: (context) => const ViewVists());

    case generateQR:
      return MaterialPageRoute(builder: (context) => const GenerateQRPage());

    default:
      throw ('This page doesnot exist');
  }
}
