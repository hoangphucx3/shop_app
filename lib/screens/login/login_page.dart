import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/custom_button.dart';
import 'package:shop_app/screens/login/forgot_password.dart';
import 'package:shop_app/screens/login/login_success.dart';
import 'package:shop_app/screens/login/otp_verification.dart';
import 'package:shop_app/screens/login/sign_up.dart';

class LoginPage extends StatelessWidget {
  static String routeName = '/loginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(height: 10),
              Text(
                'Sign in with your email and password \nor continue with social media',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: mTextColor),
              ),
              SizedBox(height: 50),
              LoginForm(),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSocialIcon(
                    icon: 'assets/icons/ic_google.png',
                    onPress: () {},
                  ),
                  buildSocialIcon(
                    icon: 'assets/icons/ic_facebook.png',
                    onPress: () {},
                  ),
                  buildSocialIcon(
                    icon: 'assets/icons/ic_twister.png',
                    onPress: () {},
                  ),
                ],
              ),
              SizedBox(height: 20),
              DontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(
            fontSize: 16,
            color: mTextColor,
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUp.routeName);
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 16,
              color: mTextColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class buildSocialIcon extends StatelessWidget {
  const buildSocialIcon({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);
  final String icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 20),
        height: 40,
        width: 40,
        child: Image.asset(icon),
        decoration: BoxDecoration(
          color: Color(0xFFE5E5E5),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> checkInputError = [];
  String email = '';
  String password = '';
  bool rememberPass = false;

  @override
  Widget build(BuildContext context) {
    // checkInput.add('demo error');
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailInputForm(),
          SizedBox(height: 20),
          passwordInputForm(),
          Row(
            children: [
              Checkbox(
                  value: rememberPass,
                  activeColor: mPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      rememberPass = value!;
                    });
                  }),
              Text(
                'Remember me',
                style: TextStyle(
                  fontSize: 16,
                  color: mTextColor,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ForgotPassword.routeName);
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 16,
                      color: mTextColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: List.generate(
              checkInputError.length,
              (index) => checkInputText(error: checkInputError[index]),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
                btnText: 'Continue',
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                  if(checkInputError.isEmpty) {
                    Navigator.pushNamed(context, OtpVerification.routeName);
                  }
                }),
          ),
        ],
      ),
    );
  }

  TextFormField passwordInputForm() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      validator: (value) {
        if (value!.isEmpty && !checkInputError.contains(nullPasswordError)) {
          setState(() {
            checkInputError.add(nullPasswordError);
          });
        } else if (value.length < 6 &&
            !checkInputError.contains(shortPasswordError)) {
          setState(() {
            checkInputError.add(shortPasswordError);
          });
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty && checkInputError.contains(nullPasswordError)) {
          setState(() {
            checkInputError.remove(nullPasswordError);
          });
        } else if (value.length >= 6 &&
            checkInputError.contains(shortPasswordError)) {
          setState(() {
            checkInputError.remove(shortPasswordError);
          });
        }
      },
      decoration: InputDecoration(
        hintText: 'Enter your password',
        labelText: 'Password',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.lock_outline),
        ),
        contentPadding: EdgeInsets.only(left: 20, top: 35),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: mSecondColor, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2)),
      ),
    );
  }

  TextFormField emailInputForm() {
    return TextFormField(
      onSaved: (newValue) => email = newValue!,
      validator: (value) {
        if (value!.isEmpty && !checkInputError.contains(nullEmailError)) {
          setState(() {
            checkInputError.add(nullEmailError);
          });
        } else if (!emailRegExp.hasMatch(value) &&
            !checkInputError.contains(invalidEmailError)) {
          setState(() {
            checkInputError.add(invalidEmailError);
          });
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty && checkInputError.contains(nullEmailError)) {
          setState(() {
            checkInputError.remove(nullEmailError);
          });
        } else if (emailRegExp.hasMatch(value) &&
            checkInputError.contains(invalidEmailError)) {
          setState(() {
            checkInputError.remove(invalidEmailError);
          });
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.mail_outline),
        ),
        contentPadding: EdgeInsets.only(left: 20, top: 35),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: mSecondColor, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2)),
      ),
    );
  }
}

Row checkInputText({required String error}) {
  return Row(
    children: [
      Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 18,
      ),
      Text(
        '  $error',
        style: TextStyle(color: Colors.red),
      ),
    ],
  );
}
