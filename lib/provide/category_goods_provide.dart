/*
 * Copyright (C) 2018,米珈科技有限公司 All rights reserved.
 * Project：baixingshenghuo
 * Author：马靖乘
 * Date：3/22/19 3:43 PM
 */
import 'package:flutter_shop/model/category_goods_list.dart';
import 'package:flutter/material.dart';

class CategoryGoodsProvide extends ChangeNotifier {
  List<CategoryListData> list = [];

  getCategoryGoodsList(List<CategoryListData> newList) {
    list = newList;
    notifyListeners();
  }

  getMoreList(List<CategoryListData> newList) {
    list.addAll(newList);
    notifyListeners();
  }
}
