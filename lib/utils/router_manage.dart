import 'package:flutter/material.dart';

import '../ui/page/view/banner/banner_page.dart';
import '../ui/page/view/bar/app_bar_page.dart';
import '../ui/page/view/bar/tab_bar_page.dart';
import '../ui/page/view/button/button_page.dart';
import '../ui/page/view/image/image_page.dart';
import '../ui/page/view/text/text_page.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/12
///INTRODUCE:路由管理

class RouterManage {
  //Button页面路由
  static const String buttonPage = "button_page";

  //Text页面路由
  static const String textPage = "text_page";

  //Image页面路由
  static const String imagePage = "image_page";

  //AppBar页面路由
  static const String appBarPage = "app_bar_page";

  //TabBar页面路由
  static const String tabBarPage = "tab_bar_page";

  //Banner页面路由
  static const String bannerPage = "banner_page";

  //路由地址
  final routes = {
    //Text页面
    textPage: (context) => const TextPage(),
    //Image页面
    imagePage: (context) => const ImagePage(),
    //Button页面
    buttonPage: (context) => const ButtonPage(),
    //AppBar页面
    appBarPage: (context) => const AppBarPage(),
    //TabBar页面
    tabBarPage: (context) => const TabBarPage(),
    //Banner页面
    bannerPage: (context) => const BannerPage(),
  };

  static final RouterManage _instance = RouterManage._();

  RouterManage._();

  factory RouterManage() => _instance;
}

/*
 * 路由模块化
 * */
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function pageContentBuilder = RouterManage._instance.routes[name]!;
  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};
