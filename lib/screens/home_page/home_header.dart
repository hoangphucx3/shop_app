import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/provider/cart_provider.dart';

import '../../constants.dart';
import '../cart_page/cart_page.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.width, required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildSearchField(width: width, height: height,),
          BuildCartIcon(height: height,),
          BuildIconWithCount(
            icon: 'assets/icons/ic_note.png',
            iconSize: height-3,
            numberIcon: 10,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class BuildCartIcon extends StatelessWidget {
  const BuildCartIcon({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return BuildIconWithCount(
      icon: 'assets/icons/ic_cart.png',
      iconSize: height-3,
      numberIcon: context.watch<CartList>().length,
      press: () {
        Navigator.pushNamed(context, CartPage.routeName);
      },
    );
  }
}

class BuildSearchField extends StatelessWidget {
  const BuildSearchField({
    Key? key,
    required this.width, required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      height: 50,
      width: width * 0.6,
      decoration: BoxDecoration(
        color: mSecondColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onChanged: (value) {},
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search Product',
          suffixIcon: GestureDetector(
              onTap: () {}, child: Icon(Icons.search)),
        ),
      ),
    );
  }
}

class BuildIconWithCount extends StatelessWidget {
  const BuildIconWithCount(
      {Key? key, required this.icon, required this.press, this.numberIcon = 0, required this.iconSize})
      : super(key: key);
  final String icon;
  final void Function() press;
  final int numberIcon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: iconSize,
            width: iconSize,
            child: Image.asset(icon),
            decoration: BoxDecoration(
              color: Color(0xFFE5E5E5),
              shape: BoxShape.circle,
            ),
          ),
          if (numberIcon != 0)
            Positioned(
              top: 0,
              right: -3,
              child: Container(
                padding: EdgeInsets.all(0.5),
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: mPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$numberIcon',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

