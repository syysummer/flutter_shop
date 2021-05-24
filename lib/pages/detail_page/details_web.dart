import 'package:flutter_shop/provide/details_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DetailsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var goodsDetails = Provide.value<DetailInfoProvide>(context).goodsInfo.data.goodInfo.goodsDetail;
    return Consumer<DetailInfoProvide>(
      builder: (context, val, child) {
        var isLeft = val.isLeft;
        if (isLeft) {
          return Container(
            child: Html(data: val.goodsInfo.data.goodInfo.goodsDetail),
          );
        } else {
          return Container(
            width: ScreenUtil().setWidth(750),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text("暂无数据"),
          );
        }
      },
    );
  }
}
