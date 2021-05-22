import 'package:flutter_shop/model/category.dart';
import 'package:flutter/material.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0; //子类高亮索引
  String categoryId = "4"; //默认第一个大类id
  int page = 1; //列表页数
  String noMoreText = ""; //显示没有数据的文字

  String subId = ""; //小类id
  //大类切换
  getChildCategory(List<BxMallSubDto> list, String id) {
    childIndex = 0; //每次点击大类必须要清零
    categoryId = id;
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = "";
    all.mallCategoryId = "00";
    all.mallSubName = "全部";
    all.comments = "null";
    childCategoryList = [all];
    childCategoryList.addAll(list);
    page = 1;
    noMoreText = "";
    notifyListeners();
  }

  //改变子类索引（右侧上边 ）
  changeChildIndex(index, String id) {
    childIndex = index;
    subId = id;
    page = 1;
    noMoreText = "";
    notifyListeners();
  }

  //增加page的方法
  addPage() {
    page++;
  }

  changeNoMore(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
