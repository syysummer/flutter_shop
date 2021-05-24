import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './application.dart';
import './router_handler.dart';

class Routes {
  static String root = "/";
  static String detailPage = "/detail";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR====>ROUTE WAS NOT FONUND!!!');
    });

    //每一个路由规则都需要在这里进行新的定义
    router.define(detailPage, handler: detailsHandler);
  }

  //自定义的参数跳转
  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
      TransitionType transition = TransitionType.native}) {
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');
    path = path + query;
    return Application.router.navigateTo(context, path, transition: transition);
  }
}
