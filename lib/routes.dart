import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/cart_page/cart_page.dart';
import 'package:shop_app/screens/details_page/detail_page.dart';
import 'package:shop_app/screens/home_page/home_page.dart';
import 'package:shop_app/screens/login/forgot_password.dart';
import 'package:shop_app/screens/login/login_page.dart';
import 'package:shop_app/screens/login/login_success.dart';
import 'package:shop_app/screens/login/otp_verification.dart';
import 'package:shop_app/screens/login/sign_up.dart';
import 'package:shop_app/screens/page0/page_0.dart';


final Map<String, WidgetBuilder> routes = {
  Page0.routeName: (context) => const Page0(),
  LoginPage.routeName: (context) => const LoginPage(),
  ForgotPassword.routeName: (context) => const ForgotPassword(),
  SignUp.routeName: (context) => const SignUp(),
  LoginSuccess.routeName: (context) => const LoginSuccess(),
  OtpVerification.routeName: (context) => const OtpVerification(),
  HomePage.routeName: (context) => const HomePage(),
  DetailPage.routeName: (context) => const DetailPage(),
  CartPage.routeName: (context) => const CartPage(),
};