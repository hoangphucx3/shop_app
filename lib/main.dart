import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/page0/page_0.dart';
import 'constants.dart';

void main() {
  final CartList myCarts = CartList();

  runApp(
    ChangeNotifierProvider.value(
      value: myCarts,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          color: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: mTextColor,
            fontSize: 18,
          ),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: mTextColor),
          bodyText2: TextStyle(color: mTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const Page0(),
      initialRoute: Page0.routeName,
      routes: routes,
    );
  }
}
