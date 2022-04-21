import 'dart:async';

import 'package:flutter/material.dart';


class DiscountBanner extends StatefulWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);
  @override
  State<DiscountBanner> createState() => _DiscountBannerState();
}

class _DiscountBannerState extends State<DiscountBanner> {
  List<Map<String, String>> listBanner = [
    {
      'text1': 'A Summer Surprise\n',
      'text2': 'Cashback 20%',
      'banner': 'assets/images/banner1.jpg',
      'textColor': '0xFFFF0000',
    },
    {
      'text1': 'Black Friday\n',
      'text2': 'Super Sale 50%',
      'banner': 'assets/images/banner2.jpg',
      'textColor': '0xFF000000',
    },
    {
      'text1': 'New deals every 2 hours\n',
      'text2': 'Up to 60% Off',
      'banner': 'assets/images/banner3.jpg',
      'textColor': '0xFFFFFF00',
    },
  ];

  int _crrPage = 0;
  late Timer _timer;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_crrPage < listBanner.length-1) {
        _crrPage++;
      } else {
        _crrPage = 0;
      }
      _pageController.animateToPage(
        _crrPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: PageView.builder(
        controller: _pageController,
        itemCount: listBanner.length,
        itemBuilder: (BuildContext context, int index) =>
            BuildBannerPage(
              text1: '${listBanner[index]['text1']}',
              text2: '${listBanner[index]['text2']}',
              banner: '${listBanner[index]['banner']}',
              textColor: '${listBanner[index]['textColor']}',
            ),
      ),
    );
  }
}

class BuildBannerPage extends StatelessWidget {
  const BuildBannerPage({
    Key? key,
    required this.text1,
    required this.text2,
    required this.banner,
    required this.textColor,
  }) : super(key: key);
  final String text1;
  final String text2;
  final String banner;
  final String textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(banner),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          text: text1,
          style: TextStyle(
              color: Color(int.parse(textColor)), fontSize: 16),
          children: [
            TextSpan(
              text: text2,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}