import 'package:flutter_shop/pages/order/my_order_page.dart';
import 'package:flutter/material.dart';

class OrderBottomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.5,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _item(context, Icon(Icons.attach_money), "待付款"),
          _item(context, Icon(Icons.rounded_corner), "待发货"),
          _item(context, Icon(Icons.credit_card), "待收货"),
          _item(context, Icon(Icons.event_available), "待评价"),
        ],
      ),
    );
  }

  Widget _item(context, Widget icon, String title) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          switch (title) {
            case "待付款":
              _jumpPage(context, 1);
              break;
            case "待发货":
              _jumpPage(context, 2);
              break;
            case "待收货":
              _jumpPage(context, 3);
              break;
            case "待评价":
              _jumpPage(context, 4);
              break;
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            SizedBox(
              height: 5,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }

  void _jumpPage(context, index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyOrderPage(index);
    }));
  }
}
