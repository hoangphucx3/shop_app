import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/custom_button.dart';
import '../../provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  static String routeName = '/cart_page';

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: CartPageBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            'Your cart',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          Text('${context.watch<CartList>().length} items'),
        ],
      ),
    );
  }
}

class CartPageBody extends StatelessWidget {
  const CartPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Your Name\'s Store',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          CartListView(),
          PaymentField(),
        ],
      ),
    );
  }
}

class CartListView extends StatelessWidget {
  const CartListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myCarts = context.watch<CartList>();

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.symmetric(vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            myCarts.length,
            (index) => CartListItem(
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}

class CartListItem extends StatelessWidget {
  const CartListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var myCarts = context.watch<CartList>();

    return Dismissible(
      key: Key(myCarts.get(index).product.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        context.read<CartList>().remove(index);
      },
      background: Container(
        decoration: BoxDecoration(
            color: Color(0xFFFFE6E6), borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Spacer(),
            Padding(
                padding: EdgeInsets.only(top: 50, bottom: 50, right: 40),
                child: Image.asset('assets/icons/ic_delete.png')),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFFF5F7F9),
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(myCarts.get(index).product.images[0]),
            ),
            SizedBox(width: 15),
            SizedBox(
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${myCarts.get(index).product.title}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text.rich(
                    TextSpan(
                      text: '\n\$${myCarts.get(index).product.price}',
                      style: TextStyle(
                        color: mPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: ' x${myCarts.get(index).numberItems}',
                          style: TextStyle(
                            color: mTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentField extends StatelessWidget {
  const PaymentField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myCarts = context.watch<CartList>();

    return Padding(
      padding: EdgeInsets.only(left: 30, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 45,
                height: 50,
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F7F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset('assets/icons/ic_bill_color.png'),
              ),
              Row(
                children: [
                  Text(
                    'Add voucher code ',
                    style: TextStyle(fontSize: 16, color: mPrimaryColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: mPrimaryColor,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text.rich(
                  TextSpan(
                    text: 'Total:\n',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                        text:
                            '\$${double.parse((myCarts.getTotal()).toStringAsFixed(2))}',
                        style: TextStyle(
                          color: mPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                height: 40,
                child: CustomButton(
                  btnText: 'Check Out',
                  onPress: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
