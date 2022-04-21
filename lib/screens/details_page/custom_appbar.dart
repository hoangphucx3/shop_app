import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar({required Widget child, required Size preferredSize})
      : super(child: child, preferredSize: preferredSize);
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundIcon(),
            RatingStar(rating: rating),
          ],
        ),
      ),
    );
  }
}

class RoundIcon extends StatelessWidget {
  const RoundIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 7),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class RatingStar extends StatelessWidget {
  const RatingStar({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$rating',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
