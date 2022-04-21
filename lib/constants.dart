import 'package:flutter/material.dart';

const mPrimaryColor = Color(0xFFFF4400);
const mPrimaryLightColor = Color(0xFFFFECDF);
const mPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);
const mSecondColor = Color(0xFF979797);
const mTextColor = Color(0xFF757575);

const mAnimalDuration = Duration(milliseconds: 200);

final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String nullEmailError = 'Please enter your email!';
const String invalidEmailError = 'Please enter valid email';
const String nullPasswordError = 'Please enter your password';
const String shortPasswordError = 'Password is too short';
const String wrongPasswordError = 'Password not match';

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 17),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
  borderSide: BorderSide(
    color: mTextColor,
    width: 2,
  ),
  borderRadius: BorderRadius.circular(15),
);
}