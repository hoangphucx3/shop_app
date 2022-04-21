import 'package:flutter/material.dart';
import 'package:shop_app/screens/page0/body.dart';

class Page0 extends StatelessWidget {
  static String routeName = '/page0';
  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const Body(),
    );
  }
}
