import 'package:flutter/material.dart';
import './category/left_category_nav.dart';
import './category/right_category_nav.dart';
import './category/category_goods_list.dart';
import 'package:provider/provider.dart';
import '../provide/child_category.dart';
import '../provide/category_goods_provide.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChildCategory()),
        ChangeNotifierProvider(create: (_) => CategoryGoodsProvide())
      ],
      child: Container(
        child: Scaffold(
          appBar: AppBar(title: Text('商品分类')),
          body: Container(
            child: Row(
              children: <Widget>[
                LeftCategoryNav(),
                Column(
                  children: <Widget>[
                    RightCategoryNavState(),
                    CategoryGoodsList(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
