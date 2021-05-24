import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_item/order_item_all.dart';

//全部订单
class AllOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(1264),
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: EasyRefresh(
                footer: CustomFooter(
                  enableInfiniteLoad: false,
                  extent: 40.0,
                  triggerDistance: 50.0,
                  footerBuilder: (context,
                      loadState,
                      pulledExtent,
                      loadTriggerPullDistance,
                      loadIndicatorExtent,
                      axisDirection,
                      float,
                      completeDuration,
                      enableInfiniteLoad,
                      success,
                      noMore) {
                    return Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                              width: 30.0,
                              height: 30.0,
                              child: Center(
                                child: Text('加载中...'),
                              )),
                        ),
                      ],
                    );
                  },
                ),
                header: BezierCircleHeader(),
                onRefresh: () {},
                onLoad: () {},
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return OrderItemAll();
                    }),
              ))
        ],
      ),
    );
  }
}
