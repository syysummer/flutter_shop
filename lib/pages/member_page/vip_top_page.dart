import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VipTopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 213,
      width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFEECBE9), Color(0xFFA2D4E7)]),
          border: Border(
              bottom: BorderSide(
                  color: Color(0xFFF8F8F8),
                  width: ScreenUtil().setHeight(11)))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 80,
              width: 80,
              child: ClipOval(
                  child: Image.network(
                      'https://user-gold-cdn.xitu.io/2018/6/24/164322d8c6c45841?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1')),
            ),
            //  Icon(Icons.headset_mic),
            SizedBox(height: 10),
            Text(
              "syySummer",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
