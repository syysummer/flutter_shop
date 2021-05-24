import 'package:flutter_shop/provide/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        color: Colors.white,
        width: ScreenUtil().setWidth(750),
        child: Consumer<CartProvide>(builder: (context, val, child) {
          return Row(
            children: <Widget>[
              selectAllBtn(context),
              allPriceArea(context),
              goButton(context),
            ],
          );
        }));
  }

//全选按钮
  Widget selectAllBtn(context) {
    bool isAllCheck =
        Provider.of<CartProvide>(context, listen: false).isAllCheck;
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllCheck,
            activeColor: Colors.pink,
            onChanged: (bool val) {
              Provider.of<CartProvide>(context, listen: false)
                  .changeAllCheckBtnState(val);
            },
          ),
          Text('全选')
        ],
      ),
    );
  }

  //中间部分
  Widget allPriceArea(context) {
    double allPrice = Provider.of<CartProvide>(context, listen: false).allPrice;
    return Expanded(
        flex: 1,
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: Text(""), flex: 1),
                  Container(
                    child: Text(
                      "合计：",
                      style: TextStyle(fontSize: ScreenUtil().setSp(36)),
                    ),
                  ),
                  Container(
                    child: Text(
                      "￥ $allPrice",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(36),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "满10元免配送费，预购免配送费",
                  style: TextStyle(
                      color: Colors.black38, fontSize: ScreenUtil().setSp(22)),
                ),
              )
            ],
          ),
        ));
  }

  //结算
  Widget goButton(context) {
    int allGoodsCount =
        Provider.of<CartProvide>(context, listen: false).allGoodsCount;
    return Container(
      width: ScreenUtil().setWidth(140),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(3)),
          child: Text(
            "结算($allGoodsCount)",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
