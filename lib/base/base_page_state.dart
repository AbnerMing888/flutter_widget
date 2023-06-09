import 'package:flutter/material.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/11
///INTRODUCE:页面状态基类

abstract class BasePageState<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: showAppBar()
            ? AppBar(
                title: Text(
                  getTitle(),
                  style: const TextStyle(fontSize: 18),
                ),
                centerTitle: true, //居中
                leading: showLeftBack()
                    ? IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          //点击事件,退出页面
                          Navigator.pop(context);
                        },
                      )
                    : null,
              )
            : null,
        body: getBody(context),
        bottomNavigationBar: getBottomNavigationBar());
  }

  String getTitle();

  Widget getBody(BuildContext context);

  /*
  * 是否展示左边的返回键
  * */
  bool showLeftBack() {
    return true;
  }

  /*
  * 是否展示AppBar
  * */
  bool showAppBar() {
    return true;
  }

  /*
  * 底部Tab
  * */
  Widget? getBottomNavigationBar() {
    return null;
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    super.dispose();
    destroy();
  }

  /*
   *初始化数据
   */
  void initData() {}

  /*
   *组件销毁
   */
  void destroy() {}
}
