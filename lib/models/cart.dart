
import 'package:shop_app/models/demo_product.dart';
import 'package:shop_app/models/product.dart';

class Cart {
  final Product product;
  int numberItems;

  Cart({required this.product, required this.numberItems});

  void setNumberItem(int newNumberItem) {
    numberItems = newNumberItem;
  }
}

//demo cart
//
// List<Cart> demoCart = [
//   Cart(product: demoProducts[1], numberItems: 2),
//   Cart(product: demoProducts[2], numberItems: 1),
//   Cart(product: demoProducts[3], numberItems: 3),
//   Cart(product: demoProducts[0], numberItems: 3),
//   Cart(product: demoProducts[4], numberItems: 3),
// ];