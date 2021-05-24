import 'package:flutter_shop/pages/order/my_order_page.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.5,
      color: Colors.white,
      child: Center(
          child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MyOrderPage(0);
          }));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                color: Colors.black12,
                width: 1,
              ))),
          child: ListTile(
            leading: Icon(Icons.book),
            title: Text("我的订单"),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
      )),
    );
  }
}
