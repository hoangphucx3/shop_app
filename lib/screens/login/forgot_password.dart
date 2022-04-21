import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../custom_button.dart';
import 'login_page.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = '/forgot_password';

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                'Forgot Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(height: 10),
              Text(
                'Please enter your email and we will send \nyou a link to return to your account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: mTextColor),
              ),
              SizedBox(height: 100),
              LoginForm(),
              SizedBox(height: 100),
              DontHaveAccount(),
            ],
          ),
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

  @override
  Widget build(BuildContext context) {
    // checkInput.add('demo error');
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailInputForm(),
          SizedBox(height: 20),
          Column(
            children: List.generate(
              checkInputError.length,
              (index) => checkInputText(error: checkInputError[index]),
            ),
          ),
          SizedBox(height: 100),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
                btnText: 'Continue',
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
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
}
