import 'package:flutter/material.dart';

import 'order_item_bottom.dart';
import 'order_item_interior.dart';

//订单的整个Item
class OrderItemAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 11,
            color: Colors.black12,
          ),
          Container(
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return OrderItemInterior();
                }),
            height: 240,
          ),
          OrderItemBottom(),
        ],
      ),
    );
  }
}
