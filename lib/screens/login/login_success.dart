import 'package:flutter/material.dart';
import 'package:shop_app/custom_button.dart';
import 'package:shop_app/screens/home_page/home_page.dart';

class LoginSuccess extends StatelessWidget {
  static String routeName = '/login_success';

  const LoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          title: Text('Login Success'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 400,
                child: Center(
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Image.asset(
                      'assets/images/success.png',
                    ),
                  ),
                ),
              ),
              Text(
                'Login Success',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomButton(
                    btnText: 'Back to home',
                    onPress: () {
                      Navigator.pushNamed(context, HomePage.routeName);
                    }),
              ),
            ],
          ),
        ));
  }
}
