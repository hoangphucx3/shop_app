import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/demo_product.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/screens/home_page/popular_product.dart';
import 'categories.dart';
import 'special_offers.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(
                width: width,
                height: 50,
              ),
              SizedBox(height: height * 0.02),
              DiscountBanner(),
              SizedBox(height: height * 0.02),
              Categories(),
              SizedBox(height: height * 0.02),
              BuildSpecialOffers(),
              SizedBox(height: height * 0.02),
              PopularProduct(),
              HomeFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeFooter extends StatelessWidget {
  const HomeFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BorderedIcon(icon: Icons.home_outlined),
          BorderedIcon(icon: Icons.favorite_border_outlined),
          BorderedIcon(icon: Icons.sms_outlined),
          BorderedIcon(icon: Icons.person),
        ],
      ),
    );
  }
}

class BorderedIcon extends StatelessWidget {
  const BorderedIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFFFFA53E),
        ),
      ),
      child: Icon(
        icon,
        color: Color(0xFFFF7643),
        size: 28,
      ),
    );
  }
}
