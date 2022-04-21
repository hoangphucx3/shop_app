import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';

class CartList with ChangeNotifier{
  List<Cart> myCarts = [];

  void addCart(Cart cart) {
    List<String> cartsId = myCarts.map((e) => e.product.id).toList();
    if(!cartsId.contains(cart.product.id)) {
      myCarts.add(cart);
    } else {
      int newCartIndex = cartsId.indexOf(cart.product.id);
      int crrNumberItem = myCarts[newCartIndex].numberItems;
      myCarts[newCartIndex].setNumberItem(crrNumberItem+cart.numberItems);
    }
    notifyListeners();
  }

  int get length => myCarts.length;

  Cart get(int index) {
    return myCarts[index];
  }

  void remove(int index) {
    myCarts.removeAt(index);
    notifyListeners();
  }

  double getTotal() {
    double total = 0;
    for (int i = 0; i < myCarts.length; i++) {
      total += (myCarts[i].product.price * myCarts[i].numberItems);
    }
    return total;
  }
}
