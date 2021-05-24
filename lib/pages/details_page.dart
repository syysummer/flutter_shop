import 'package:flutter_shop/provide/details_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'detail_page/detail_tabbar.dart';
import 'detail_page/details_bottom.dart';
import 'detail_page/details_explain.dart';
import 'detail_page/details_top_area.dart';
import 'detail_page/details_web.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("商品详情"),
      ),
      body: FutureBuilder(
          future: _getBackInfo(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  Container(
                    child: ListView(
                      children: <Widget>[
                        DetailsTopArea(),
                        DetailsExplain(),
                        DetailsTabbar(),
                        DetailsWeb(),
                        SizedBox(
                          height: ScreenUtil().setHeight(100),
                        )
                      ],
                    ),
                  ),
                  Positioned(bottom: 0, left: 0, child: DetailsBottom()),
                ],
              );
            } else {
              return Text("加载中……");
            }
          }),
    );
  }

  Future _getBackInfo(BuildContext context) async {
    await Provider.of<DetailInfoProvide>(context, listen: false)
        .getGoodsInfo(goodsId);
    return "完成加载";
  }
}
