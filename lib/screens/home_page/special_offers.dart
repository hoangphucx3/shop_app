import 'package:flutter/material.dart';


class BuildSpecialOffers extends StatelessWidget {
  const BuildSpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Special for you',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              GestureDetector(onTap: () {}, child: Text('See More')),
            ],
          ),
        ),
        BuildCollection(),
      ],
    );
  }
}

class BuildCollection extends StatelessWidget {
  BuildCollection({
    Key? key,
  }) : super(key: key);
  List<Map<String, dynamic>> collections = [
    {
      'background': 'assets/images/banner_phone.jpg',
      'name': 'Smartphones',
      'count': 23,
    },
    {
      'background': 'assets/images/banner_cosmetic.jpg',
      'name': 'Cosmetics',
      'count': 11,
    },
    {
      'background': 'assets/images/banner_bag.jpg',
      'name': 'Fashions',
      'count': 50,
    },
    {
      'background': 'assets/images/banner_jewel.jpg',
      'name': 'Jewels',
      'count': 88,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
            children: List.generate(
              collections.length,
                  (index) => CollectionCard(
                background: '${collections[index]['background']}',
                productName: '${collections[index]['name']}',
                productCount: collections[index]['count'],
                press: () {},
              ),
            )),
      ),
    );
  }
}

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    Key? key,
    required this.background,
    required this.productName,
    this.productCount = 0, required this.press,
  }) : super(key: key);

  final String background;
  final String productName;
  final int productCount;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(background, fit: BoxFit.cover),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Center(
                  heightFactor: 1.8,
                  widthFactor: 1.4,
                  child: Text.rich(
                    TextSpan(
                      text: '$productName\n',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      children: [
                        TextSpan(
                          text: '$productCount product',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}