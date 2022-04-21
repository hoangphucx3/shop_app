import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/custom_button.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/demo_product.dart';
import 'package:shop_app/provider/cart_provider.dart';
import '../../constants.dart';
import '../../models/product.dart';
import '../home_page/popular_product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.productIndex,
  }) : super(key: key);

  final int productIndex;

  @override
  Widget build(BuildContext context) {
    final product = demoProducts[productIndex];
    return TopRoundContainer(
      product: product,
      color: Colors.white,
      child: ProductDescription(
        productIndex: productIndex,
      ),
    );
  }
}

class TopRoundContainer extends StatelessWidget {
  const TopRoundContainer({
    Key? key,
    required this.product,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Product product;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: child,
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.productIndex,
  }) : super(key: key);

  final int productIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DescriptionText(productIndex: productIndex),
        DescriptionColor(productIndex: productIndex),
      ],
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required this.productIndex,
  }) : super(key: key);

  final int productIndex;

  @override
  Widget build(BuildContext context) {
    var product = demoProducts[productIndex];
    return Padding(
      padding: EdgeInsets.only(top: 25, bottom: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 60,
                height: 45,
                decoration: BoxDecoration(
                  color: mPrimaryLightColor,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20),
                  ),
                ),
                child: FavoriteProduct2(
                  productIndex: productIndex,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 65, bottom: 10),
            child: Text(
              product.description,
              maxLines: 3,
              style: TextStyle(color: mTextColor, height: 1.5),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'See More Detail',
                  style: TextStyle(color: mPrimaryColor),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: mPrimaryColor,
                  size: 12,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionColor extends StatelessWidget {
  const DescriptionColor({
    Key? key,
    required this.productIndex,
  }) : super(key: key);

  final int productIndex;

  @override
  Widget build(BuildContext context) {
    var product = demoProducts[productIndex];
    return TopRoundContainer(
      product: product,
      color: Color(0xFFF6F7F9),
      child: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 10),
        child: AddToCartField(product: product),
      ),
    );
  }
}

class AddToCartField extends StatefulWidget {
  const AddToCartField({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<AddToCartField> createState() => _AddToCartFieldState();
}

class _AddToCartFieldState extends State<AddToCartField> {
  int selectedColor = 0;
  int numberItem = 1;

  @override
  Widget build(BuildContext context) {
    var myCart = context.watch<CartList>();

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    widget.product.colors.length,
                        (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: index == selectedColor
                                    ? mPrimaryColor
                                    : Colors.transparent)),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: widget.product.colors[index], shape: BoxShape.circle),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$numberItem',
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.wavy,
                              color: mPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          numberItem -= numberItem > 1 ? 1 : 0;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(5),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(Icons.remove),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          numberItem++;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          TopRoundContainer(
            product: widget.product,
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.only(
                    top: 20, left: 70, right: 70, bottom: 65),
                child:
                CustomButton(btnText: 'Add to Cart', onPress: () {
                  myCart.addCart(Cart(product: widget.product, numberItems: numberItem));
                  Navigator.pop(context);
                }),),
          ),
        ],
      ),
    );
  }
}
