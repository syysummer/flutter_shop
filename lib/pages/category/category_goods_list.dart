/*
 * Copyright (C) 2018,米珈科技有限公司 All rights reserved.
 * Project：baixingshenghuo
 * Author：马靖乘
 * Date：3/22/19 4:53 PM
 */
import 'dart:convert';
import 'package:flutter_shop/model/category_goods_list.dart';
import 'package:flutter_shop/provide/category_goods_provide.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  GlobalKey _easyRefreshKey = new GlobalKey();

  var scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryGoodsProvide>(
      builder: (context, categoryGoodsProvide, child) {
        if (categoryGoodsProvide.list != null &&
            categoryGoodsProvide.list.length != 0) {
          return new EasyRefresh(
            key: _easyRefreshKey,
            footer: MaterialFooter(),
            firstRefresh: true,
            child: SingleChildScrollView(
              child: Container(
                width: ScreenUtil().setWidth(570),
                height: ScreenUtil().setHeight(980),
                child: ListView.builder(
                  itemCount: categoryGoodsProvide.list.length,
                  itemBuilder: (context, index) {
                    return _ListWidget(categoryGoodsProvide.list, index);
                  },
                ),
              ),
            ),
            // onRefresh: () async{ .... },
            onLoad: () async {
              print('开始加载更多');
              // _getHotGoods();
            },
          );
        } else {
          return Container(
            height: ScreenUtil().setHeight(980),
            child: Center(
              child: Text('暂无数据'),
            ),
          );
        }
      },
    );
  }

  Widget _ListWidget(List newList, int index) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black12))),
          child: SingleChildScrollView(
            child: Row(
              children: <Widget>[
                _goodsImage(newList, index),
                Column(
                  children: <Widget>[
                    _goodsName(newList, index),
                    _goodsPrice(newList, index)
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget _goodsImage(List newList, int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(newList[index].image),
    );
  }

  Widget _goodsName(List newList, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        newList[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(List newList, int index) {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        width: ScreenUtil().setWidth(370),
        child: Row(children: <Widget>[
          Text(
            '价格:￥${newList[index].presentPrice}',
            style:
                TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
          ),
          Text(
            '￥${newList[index].oriPrice}',
            style: TextStyle(
                color: Colors.black26, decoration: TextDecoration.lineThrough),
          )
        ]));
  }

  void _getGoodsList({String categoryId}) async {
    var data = {
      "categoryId": categoryId == null ? "4" : categoryId,
      "categorySubId": "",
      "page": 1,
    };
    await request("getMallGoods", formData: data).then((onValue) {
      var data = json.decode(onValue.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      Provider.of<CategoryGoodsProvide>(context, listen: false)
          .getCategoryGoodsList(goodsList.data);
    });
  }
}
