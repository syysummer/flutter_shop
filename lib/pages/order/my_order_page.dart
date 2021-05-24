import 'package:flutter_shop/pages/order/all_order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrderPage extends StatefulWidget {
  int currentIndex = 0;

  MyOrderPage(this.currentIndex);

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
        vsync: this, initialIndex: widget.currentIndex, length: 5);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              title: Text("订单中心"),
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(70),
                    child: TabBar(
                        controller: _controller,
                        unselectedLabelColor: Colors.black54,
                        labelColor: Colors.pink,
                        indicatorColor: Colors.red,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: <Widget>[
                          Text("全部"),
                          Text("待付款"),
                          Text("待发货"),
                          Text("待收货"),
                          Text("待评价"),
                        ]),
                  ),
                  Expanded(
                    flex: 1,
                    child:
                        TabBarView(controller: _controller, children: <Widget>[
                      AllOrderPage(),
                      AllOrderPage(),
                      AllOrderPage(),
                      AllOrderPage(),
                      AllOrderPage(),
                      //WaitPayPage(),
                      //WaitGoodsPage(),
                      //DeliveryGoodsPage(),
                      //WaitEvaluatePage(),
                    ]),
                  )
                ],
              ),
            )));
  }
}
