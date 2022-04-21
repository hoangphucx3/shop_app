import 'package:flutter/material.dart';
import 'package:shop_app/screens/details_page/detail_page.dart';

import '../../constants.dart';
import '../../models/demo_product.dart';
import '../../models/product.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Popular Product',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text('See More'),
            ],
          ),
        ),
        SizedBox(height: height * 0.01),
        ProductList(),
      ],
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: List.generate(
            demoProducts.length,
            (index) => ProductCard(
              productIndex: index,
            ),
          ),
        ),
      ),
    );
  }
}


class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key, required this.productIndex,
  }) : super(key: key);
  final int productIndex;


  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isFav;


  @override
  void initState() {
    isFav = demoProducts[widget.productIndex].isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    var product = demoProducts[widget.productIndex];
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments:
            ProductDetailsArgument(productIndex: widget.productIndex)).then((value) => reloadWhenBackFromProductDetailPage());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: 120,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                  color: mPrimaryLightColor,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('${product.images[0]}'),
                      fit: BoxFit.cover),
                ),
              ),
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(height: 1.3),
                          children: [
                            TextSpan(
                              text: '${product.title}\n',
                            ),
                            TextSpan(
                                text: '\$${product.price}',
                                style: TextStyle(
                                    color: mPrimaryColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        setState(() {
                          isFav = !isFav;
                          demoProducts[widget.productIndex].changeFav();
                        });
                      },
                      child: Center(
                        child: Stack(
                          children: [
                            if (isFav)
                              Icon(
                                Icons.favorite,
                                color: mPrimaryColor,
                              ),
                            Icon(
                              Icons.favorite_border,
                              color: mPrimaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  reloadWhenBackFromProductDetailPage() {
    setState(() {
      isFav = demoProducts[widget.productIndex].isFavourite;
    });
  }
}

class FavoriteProduct2 extends StatefulWidget {
  const FavoriteProduct2({
    Key? key,  required this.productIndex,
  }) : super(key: key);

  final int productIndex;

  @override
  State<FavoriteProduct2> createState() => _FavoriteProduct2State();
}

class _FavoriteProduct2State extends State<FavoriteProduct2> {
  late bool isFav;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFav = demoProducts[widget.productIndex].isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        setState(() {
          isFav = !isFav;
          demoProducts[widget.productIndex].changeFav();
        });
      },
      child: Center(
        child: Stack(
          children: [
            if (isFav)
              Icon(
                Icons.favorite,
                color: mPrimaryColor,
              ),
            Icon(
              Icons.favorite_border,
              color: mPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
