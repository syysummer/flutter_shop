import 'dart:convert';

import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/model/category_goods_list.dart';
import 'package:flutter_shop/provide/category_goods_provide.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

//小类右侧导航
class RightCategoryNavState extends StatefulWidget {
  @override
  _RightCategoryNavStateState createState() => _RightCategoryNavStateState();
}

class _RightCategoryNavStateState extends State<RightCategoryNavState> {
  @override
  void initState() {
    _getGoodsList('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChildCategory>(
      //接收数据
      builder: (context, childCategory, child) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: childCategory.childCategoryList.length,
              itemBuilder: (context, index) {
                return _rightInkWel(
                    index, childCategory.childCategoryList[index]);
              }),
        );
      },
    );
  }

  Widget _rightInkWel(int index, BxMallSubDto item) {
    bool isClick = false; //判断是否已经点击
    isClick = (index ==
            Provider.of<ChildCategory>(context, listen: false)
                .childIndex) //Provide.value<ChildCategory>(context).childIndex获取点击的位置
        ? true
        : false; //如果当前传过来的值和点击的相等就是已经点击过的
    return InkWell(
      onTap: () {
        Provider.of<ChildCategory>(context, listen: false).changeChildIndex(
            index,
            item.mallSubId); //Provide.value<ChildCategory>(context).changeChildIndex(index)传递值
        _getGoodsList(item.mallSubId); //小类的全部id为00
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          item.mallSubName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
            color: isClick ? Colors.pink : Colors.black, //点击的时候是粉色，没有点击的为黑色
          ),
        ),
      ),
    );
  }

  void _getGoodsList(String categorySubId) async {
    print('categorySubId');
    print(categorySubId);
    var data = {
      "categoryId":
          Provider.of<ChildCategory>(context, listen: false).categoryId,
      "categorySubId": categorySubId,
      "page": 1,
    };
    await request("getMallGoods", formData: data).then((onValue) {
      var data = json.decode(onValue.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if (goodsList.data != null) {
        Provider.of<CategoryGoodsProvide>(context, listen: false)
            .getCategoryGoodsList(goodsList.data);
      } else {
        Provider.of<CategoryGoodsProvide>(context, listen: false)
            .getCategoryGoodsList([]);
      }
    });
  }
}
