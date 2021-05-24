import 'package:flutter/material.dart';

import 'member_page/order_bottom_page.dart';
import 'member_page/order_page.dart';
import 'member_page/vip_bottom_page.dart';
import 'member_page/vip_top_page.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("会员中心"),
      ),
      body: ListView(
        children: <Widget>[
          VipTopPage(),
          OrderPage(),
          OrderBottomPage(),
          VipBottomPage(),
        ],
      ),
    );
  }
}
