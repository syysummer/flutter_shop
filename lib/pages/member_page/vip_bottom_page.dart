import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VipBottomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Color(0xFFF8F8F8),
            height: 11,
          ),
          _bottomWidget(Icon(Icons.add_alarm), "领取优惠券"),
          Divider(height: 1, color: Colors.black12),
          _bottomWidget(Icon(Icons.verified_user), "已领取优惠券"),
          Divider(height: 1, color: Colors.black12),
          _bottomWidget(Icon(Icons.add_location), "地址管理"),
          Container(
            color: Color(0xFFF8F8F8),
            height: 11,
          ),
          _bottomWidget(Icon(Icons.phone), "客服电话"),
          Divider(height: 1, color: Colors.black12),
          _bottomWidget(Icon(Icons.account_box), "关于商城"),
        ],
      ),
    );
  }

  Widget _bottomWidget(Widget icon, String title) {
    return Container(
      height: ScreenUtil().setHeight(98),
      child: InkWell(
        onTap: () {
          if (title == "领取优惠券") {
          } else if (title == "已领取优惠券") {
          } else if (title == "地址管理") {

          } else if (title == "客服电话") {

          } else if (title == "关于商城") {

          }
        },
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            icon,
            SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30), color: Colors.black54),
                )),
            Icon(Icons.arrow_forward_ios),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
