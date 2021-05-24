import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './routers/application.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:flutter_shop/provide/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DetailInfoProvide()),
        ChangeNotifierProvider(create: (_) => CartProvide()),
      ],
      child: ScreenUtilInit(
        designSize: Size(750, 1334),
        builder: () => MaterialApp(
          onGenerateRoute: Application.router.generator,
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
      ),
    );
  }
}
