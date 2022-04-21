import 'package:flutter/material.dart';

import '../../constants.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);
  List<Map<String, String>> categories = [
    {'text': 'Flash Deal', 'icon': 'assets/icons/ic_flash.png'},
    {'text': 'Bill', 'icon': 'assets/icons/ic_bill.png'},
    {'text': 'Game', 'icon': 'assets/icons/ic_game.png'},
    {'text': 'Daily Gift', 'icon': 'assets/icons/ic_gift.png'},
    {'text': 'More', 'icon': 'assets/icons/ic_more.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(categories.length, (index) => BuildCategories(
          text: '${categories[index]['text']}',
          icon: '${categories[index]['icon']}',
          press: () {},
        ),),
      ),
    );
  }
}

class BuildCategories extends StatelessWidget {
  const BuildCategories({
    Key? key,
    required this.text, required this.icon, required this.press,
  }) : super(key: key);

  final String text, icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: mPrimaryLightColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(icon),
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}