import 'package:flutter_shop/pages/cart_page/cart_item.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_page/cart_bottom.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("购物车"),
        ),
        body: FutureBuilder(
            future: _getCartInfo(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List cartList =
                    Provider.of<CartProvide>(context, listen: false).cartList;
                return Stack(
                  children: <Widget>[
                    Consumer<CartProvide>(builder: (context, index, child) {
                      cartList =
                          Provider.of<CartProvide>(context, listen: false)
                              .cartList;
                      return ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          return CartItem(cartList[index]);
                        },
                      );
                    }),
                    Positioned(bottom: 0, left: 0, child: CartBottom())
                  ],
                );
              } else {
                return Text("正在加载……");
              }
            }));
  }

  Future<String> _getCartInfo(BuildContext context) async {
    await Provider.of<CartProvide>(context, listen: false).getCartInfo();
    return "end";
  }
}
