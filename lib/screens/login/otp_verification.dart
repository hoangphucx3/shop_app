import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/custom_button.dart';
import 'package:shop_app/screens/login/login_success.dart';

class OtpVerification extends StatelessWidget {
  static String routeName = '/otp_verification';

  const OtpVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                'OTP Verification',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We sent you code to +84 932 444 ***',
                style: TextStyle(
                  color: mTextColor,
                  fontSize: 18,
                ),
              ),
              BuildTimer(),
              SizedBox(height: 30),
              OtpForm(),
              SizedBox(height: 200),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: CustomButton(btnText: 'Continue', onPress: () {
                  Navigator.pushNamed(context, LoginSuccess.routeName);
                }),
              ),
              SizedBox(height: 150),
              GestureDetector(
                onTap: (){},
                child: Text(
                  'Resend OTP',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row BuildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'This code will expired in ',
          style: TextStyle(
            color: mTextColor,
            fontSize: 18,
          ),
        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 180.0, end: 0),
          duration: Duration(seconds: 180),
          builder: (BuildContext context, num value, Widget? child) {

            return Text('${formatTime(value.toInt())}',
              style: TextStyle(
                color: mTextColor,
                fontSize: 18,
              ),
            );
          },
          onEnd: () {},
        ),
      ],
    );
  }

  String formatTime(int seconds) {
    final min = seconds~/60;
    seconds -= min*60;
    return '${min.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}';
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 60,
              width: 50,
              child: TextFormField(
                style: TextStyle(
                  fontSize: 24,
                ),
                decoration: otpInputDecoration,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                obscureText: true,
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                onSaved: (pin1) {},
              ),
            ),
            SizedBox(
              height: 60,
              width: 50,
              child: TextFormField(
                style: TextStyle(
                  fontSize: 24,
                ),
                decoration: otpInputDecoration,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                obscureText: true,
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                onSaved: (pin2) {},
              ),
            ),
            SizedBox(
              height: 60,
              width: 50,
              child: TextFormField(
                style: TextStyle(
                  fontSize: 24,
                ),
                decoration: otpInputDecoration,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                obscureText: true,
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                onSaved: (pin3) {},
              ),
            ),
            SizedBox(
              height: 60,
              width: 50,
              child: TextFormField(
                style: TextStyle(
                  fontSize: 24,
                ),
                decoration: otpInputDecoration,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                obscureText: true,
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                onSaved: (pin4) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
