import 'package:flutter_shop/provide/details_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

//详情页
class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailInfoProvide>(builder: (context, val, child) {
      //var goodsInfo = Provide.value<DetailInfoProvide>(context).goodsInfo.data.goodInfo;
      var goodsInfo = val.goodsInfo.data.goodInfo;
      if (goodsInfo != null) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              _goodsImage(goodsInfo.image1),
              _goodsName(goodsInfo.goodsName),
              _goodsNum(goodsInfo.goodsSerialNumber),
              _priceItem(goodsInfo.presentPrice, goodsInfo.oriPrice)
            ],
          ),
        );
      } else {
        return Text("正在加载……");
      }
    });
  }

  //商品图片
  Widget _goodsImage(url) {
    return Image.network(url, width: ScreenUtil().setWidth(740));
  }

  //商品名称
  Widget _goodsName(name) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  Widget _goodsNum(num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        '编号:${num}',
        style: TextStyle(color: Colors.black26),
      ),
    );
  }

  //价格
  Widget _priceItem(double presentPrice, double oriPrice) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        children: <Widget>[
          Text(
            "￥$presentPrice",
            style: TextStyle(
                color: Color.fromARGB(255, 171, 108, 65), fontSize: 20),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "市场价：",
            style: TextStyle(color: Colors.black87, fontSize: 15),
          ),
          Text(
            "￥$oriPrice",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }
}
