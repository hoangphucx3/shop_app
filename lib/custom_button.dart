import 'package:flutter/material.dart';

import 'constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.btnText, required this.onPress}) : super(key: key);
  final String btnText;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: mPrimaryColor,
          shape: const StadiumBorder(),
        ),
        onPressed: onPress,
        child: Text(
          btnText,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
