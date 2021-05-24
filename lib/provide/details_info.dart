import 'dart:convert';

import 'package:flutter_shop/model/details.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter/material.dart';

class DetailInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;
  bool isLeft = true; //点击了左边
  bool isRight = false; //点击了右边

  //tabBar的切换方法
  changeLeftAndRight(String changeState) {
    if (changeState == "left") {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }

  //从后台获取商品数据 必须要加async和await，否则报错，请求完以后才会使用数据
  getGoodsInfo(String id) async {
    var formData = {"goodId": id};
    await request("getGoodDetailById", formData: formData).then((onValue) {
      var responseData = json.decode(onValue.toString());
      goodsInfo = DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }
}
