import 'package:flutter/material.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/12
///INTRODUCE:路由工具类

class RouterUtil {
  static final _navigatorKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  /*
  * 用于跳转到指定路由
  * @routeName：为目标路由名
  * @arguments:传递的参数
  * */
  static Future<dynamic> pushNamed(String routeName,
      {Object? arguments}) async {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  /*
  * 用于返回上一个路由，并传递返回结果
  * @result：为返回结果
  * */
  static void pop<T extends Object>({T? result}) {
    navigatorKey.currentState!.pop(result);
  }

  /*
  * 用于替换当前路由，并跳转到指定路由
  * @routeName：为目标路由名
  * @arguments：传递的数据
  * */
  static Future<dynamic> pushReplacementNamed(String routeName,
      {Object? arguments}) async {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  /*
  * 用于将当前路由替换为指定路由，并从路由栈中删除原路由及之前的所有路由
  * @newRouteName：为目标路由名
  * @predicate：为过滤条件，用于决定是否删除路由
  * @arguments：传递的数据
  * */
  static Future<dynamic> pushAndRemoveUntil(
      String newRouteName, bool Function(Route<dynamic> route) predicate,
      {Object? arguments}) async {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments);
  }

  /*
  * 用于返回上一个路由，并跳转到指定路由
  * @newRouteName：为目标路由名
  * @arguments：传递的数据
  * */
  static Future<dynamic> popAndPushNamed(String newRouteName,
      {Object? arguments}) async {
    return navigatorKey.currentState!
        .popAndPushNamed(newRouteName, arguments: arguments);
  }

  /*
   *获取传递的参数
   * */
  static dynamic getArgs(BuildContext context) {
    return ModalRoute.of(context)?.settings.arguments;
  }
}
