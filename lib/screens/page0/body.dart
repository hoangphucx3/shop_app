import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/custom_button.dart';
import 'package:shop_app/screens/login/login_page.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int crrPage = 0;
  List<Map<String, String>> bgList = [
    {
      'text': 'Welcome to Tokyo, let\'s shop!',
      'image': 'assets/images/bg_4.jpg',
    },
    {
      'text': 'We help people connect with store \naround the World!',
      'image': 'assets/images/bg_6.jpg',
    },
    {
      'text': 'We show the easy way to shop.\nJust stay at home with us!',
      'image': 'assets/images/bg_3.jpg',
    },
    {
      'text': 'Expect the unexpected!',
      'image': 'assets/images/bg_1.jpg',
    },
    {
      'text': 'Life is hard enough already.\n Let us make it a little easier!',
      'image': 'assets/images/bg_2.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  crrPage = value;
                });
              },
              itemCount: bgList.length,
              itemBuilder: (context, index) => BuildPageView(
                text: '${bgList[index]['text']}',
                image: '${bgList[index]['image']}',
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    bgList.length,
                    (index) => AnimatedContainer(
                      duration: mAnimalDuration,
                      margin: const EdgeInsets.only(right: 5, top: 20),
                      height: 6,
                      width: index == crrPage ? 20 : 6,
                      decoration: BoxDecoration(
                        color: index == crrPage ? mPrimaryColor : mSecondColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomButton(
                    btnText: 'Continue',
                    onPress: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildPageView extends StatelessWidget {
  const BuildPageView({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Spacer(),
          const Text(
            'TOKYO',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: mPrimaryColor),
          ),
          const Spacer(),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: mTextColor),
          ),
          const Spacer(
            flex: 3,
          ),
          Image.asset(
            image,
            height: 365,
            width: 335,
          ),
        ],
      ),
    );
  }
}
