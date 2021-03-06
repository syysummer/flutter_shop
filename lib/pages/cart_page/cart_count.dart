import 'package:flutter_shop/provide/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartCount extends StatelessWidget {
  var item;
  String tag = "";

  CartCount(this.item, {this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(context, tag),
          _countArea(context),
          _addBtn(context, tag),
        ],
      ),
    );
  }

  //减少按钮
  Widget _reduceBtn(context, String tag) {
    return InkWell(
      onTap: () {
        Provider.of<CartProvide>(context, listen: false)
            .addOrReduceAction(item, 'reduce');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: item.count > 1 ? Colors.white : Colors.black12,
          border: Border(
              right: BorderSide(
            width: 1,
            color: Colors.black12,
          )),
        ),
        child: item.count > 1 ? Text('-') : Text(' '),
      ),
    );
  }

  //加号按钮
  Widget _addBtn(context, String tag) {
    return InkWell(
      onTap: () {
        Provider.of<CartProvide>(context, listen: false)
            .addOrReduceAction(item, 'add');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              left: BorderSide(
            width: 1,
            color: Colors.black12,
          )),
        ),
        child: Text("+"),
      ),
    );
  }

  Widget _countArea(context) {
    return Consumer<CartProvide>(builder: (context, val, child) {
      return Container(
        width: ScreenUtil().setWidth(70),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        color: Colors.white,
        child: Text('${item.count}'),
      );
    });
  }
}
