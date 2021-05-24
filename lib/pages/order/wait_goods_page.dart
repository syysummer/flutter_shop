import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_item/order_item_all.dart';

//待发货
class WaitGoodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(1264),
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return OrderItemAll();
                  }))
        ],
      ),
    );
  }
}
