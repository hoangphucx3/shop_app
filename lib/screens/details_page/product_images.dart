import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/product.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int _crrIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 5),
          width: 250,
          child: AspectRatio(
            aspectRatio: 5/4,
            child: Image.asset(
              widget.product.images[_crrIndex],
              fit: BoxFit.contain,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.product.images.length,
                (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _crrIndex=index;
                });
              },
              child: Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: _crrIndex == index ? mPrimaryColor : Colors.transparent,
                  ),
                ),
                child: Image.asset(
                  widget.product.images[index],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
