import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/login/otp_verification.dart';

import '../../constants.dart';
import '../../custom_button.dart';

class SignUp extends StatelessWidget {
  static String routeName = '/signup';

  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                'Register Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(height: 10),
              Text(
                'Create new account with your email',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: mTextColor),
              ),
              SizedBox(height: 50),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> checkInputError = [];
  String email = '';
  String password = '';
  bool rememberPass = false;
  bool hidePassword = true;
  bool hideRePassword = true;

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
          SizedBox(height: 20),
          passwordRetypeForm(),
          SizedBox(height: 20),
          Column(
            children: List.generate(
              checkInputError.length,
              (index) => checkInputText(error: checkInputError[index]),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
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

  TextFormField passwordInputForm() {
    return TextFormField(
      obscureText: hidePassword,
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
        suffixIcon: GestureDetector(
          onTap: (){
            setState(() {
              hidePassword=true;
            });
          },
          onLongPressDown: (LongPressDownDetails details){
            setState(() {
              hidePassword = false;
            });
          },
          onLongPressUp: (){
            setState(() {
              hidePassword = true;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.remove_red_eye_outlined),
          ),
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

  TextFormField passwordRetypeForm() {
    return TextFormField(
      obscureText: hideRePassword,
      validator: (value) {
        if (password != value &&
            !checkInputError.contains(wrongPasswordError)) {
          setState(() {
            checkInputError.add(wrongPasswordError);
          });
        }
        return null;
      },
      onChanged: (value) {
        if (password == value &&
            checkInputError.contains(wrongPasswordError)) {
          setState(() {
            checkInputError.remove(wrongPasswordError);
          });
        }
      },
      decoration: InputDecoration(
        hintText: 'Retype your password',
        labelText: 'Confirm Password',
        suffixIcon: GestureDetector(
          onTap: (){
            setState(() {
              hideRePassword=true;
            });
          },
          onLongPressDown: (LongPressDownDetails details){
            setState(() {
              hideRePassword = false;
            });
          },
          onLongPressUp: (){
            setState(() {
              hideRePassword = true;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.remove_red_eye_outlined),
          ),
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
}


