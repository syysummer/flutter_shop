import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '百姓生活+',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          textTheme: TextTheme(
              //To support the following, you need to use the first initialization method
              button: TextStyle(fontSize: 45.sp)),
        ),
        home: IndexPage(),
      ),
    );
  }
}
