import 'package:flutter/material.dart';

class OrderItemBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        children: <Widget>[
          _orderNumber(),
          _orderPrice(),
          _orderBtn(),
          //  Divider(height: 1, color: Colors.black12),
        ],
      ),
    );
  }

  Widget _orderNumber() {
    return Container(
      height: 36,
      child: Row(
        children: <Widget>[
          SizedBox(width: 10),
          Expanded(
              child: Text("订单号：6666666666666",
                  style: TextStyle(fontSize: 16, color: Colors.pink)),
              flex: 1),
          Text("实际金额："),
          Text("￥19.80", style: TextStyle(fontSize: 16, color: Colors.pink)),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _orderPrice() {
    return Container(
      height: 36,
      child: Row(
        children: <Widget>[
          Expanded(child: Text(""), flex: 1),
          Text("(总金额：￥19.80，含运费：￥0.00，优惠：￥0.00)"),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _orderBtn() {
    return Container(
      height: 46,
      child: Row(
        children: <Widget>[
          Expanded(child: Text(""), flex: 1),
          _button(Colors.white, Colors.grey, Colors.black54, "取消订单"),
          SizedBox(width: 5),
          _button(Colors.pink, Colors.white, Colors.white, "去支付"),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _button(
      Color backColor, Color borderColor, Color textColor, String title) {
    return InkWell(
      child: Container(
          height: 30,
          width: 80,
          decoration: BoxDecoration(
              color: backColor,
              border: Border.all(
                color: borderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: textColor),
            ),
          )),
    );
  }
}
