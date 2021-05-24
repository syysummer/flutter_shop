import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//订单Item里面的小Item
class OrderItemInterior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: ScreenUtil().setWidth(750),
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Text("百姓量贩融金我国际店", style: TextStyle(fontSize: 14)),
                top: 10,
                left: 10),
            Positioned(
                child: Text("待付款", style: TextStyle(fontSize: 14)),
                top: 10,
                right: 10),
            Positioned(
                child: Container(
                  height: 80,
                  width: ScreenUtil().setWidth(750),
                  child: Row(
                    children: <Widget>[
                      Image(
                          height: 80,
                          width: 80,
                          image: AssetImage("images/type_channelplane.png")),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //设置起始对齐
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                      "鹿邑大曲46°450ml(精制)鹿邑大曲46°鹿邑大曲46°450ml(精制)鹿邑大曲46°",
                                      softWrap: true)),
                              _numberPrice(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                top: 30,
                left: 10),
            Positioned(
                child: Container(
                    height: 1,
                    width: ScreenUtil().setWidth(750),
                    color: Colors.black12),
                bottom: 0)
          ],
        ));
  }


  Widget _numberPrice() {
    return Row(
      children: <Widget>[
        Text("×2"),
        Expanded(flex: 1, child: Text("")),
        Text("￥19.80"),
        SizedBox(width: 10)
      ],
    );
  }
}
