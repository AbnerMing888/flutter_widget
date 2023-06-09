import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/page/main/main_tab.dart';
import 'utils/router_manage.dart';
import 'utils/router_util.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/11
///INTRODUCE:主入口

void main() {
  runApp(const MyApp());
  // 修改状态栏为白色
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.red));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: RouterUtil.navigatorKey,
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute,
        home: const MainTab(),
        theme: ThemeData(primarySwatch: Colors.red),
        debugShowCheckedModeBanner: false);
  }
}
