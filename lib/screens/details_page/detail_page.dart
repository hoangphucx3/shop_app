import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/demo_product.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/details_page/product_detail.dart';
import 'package:shop_app/screens/details_page/product_images.dart';
import 'package:shop_app/screens/home_page/popular_product.dart';
import 'custom_appbar.dart';

class DetailPage extends StatelessWidget {
  static String routeName = '/detail_page';

  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArgument argument =
        ModalRoute.of(context)?.settings.arguments as ProductDetailsArgument;
    final productIndex = argument.productIndex;
    final product = demoProducts[productIndex];
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(
          child: MyAppBar(
            rating: product.rating,
          ),
          preferredSize: Size.fromHeight(AppBar().preferredSize.height)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImages(product: product),
            SizedBox(height: 10),
            ProductDetails(productIndex: productIndex),
          ],
        ),
      ),
    );
  }
}


class ProductDetailsArgument {
  final int productIndex;

  ProductDetailsArgument({required this.productIndex});
}
