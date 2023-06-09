import "package:flutter/material.dart";

import "../../../base/base_page_state.dart";
import "../../../data/bean/main_tab_bean.dart";
import "../home/home_page.dart";
import "../list/list_page.dart";
import "../net/net_page.dart";
import "../util/util_page.dart";
import "../view/view_page.dart";

///AUTHOR:AbnerMing
///DATE:2023/5/11
///INTRODUCE:主页面底部Tab

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<StatefulWidget> createState() => _MainTabState();
}

class _MainTabState extends BasePageState {
  // 当前选中标签的下标
  int _currentIndex = 0;

  // 当前页面数组
  final List _pageList = [
    const HomePage(),
    const NetPage(),
    const ViewPage(),
    const ListPage(),
    const UtilPage()
  ];

  //当前底部文字列表
  final List<MainTabBean> _pageContent = [
    MainTabBean("首页", Icons.home_outlined),
    MainTabBean("网络", Icons.webhook),
    MainTabBean("View", Icons.grid_view_outlined),
    MainTabBean("列表", Icons.list_alt),
    MainTabBean("工具", Icons.settings)
  ];

  @override
  Widget getBody(BuildContext context) {
    return _pageList[_currentIndex];
  }

  @override
  String getTitle() {
    return _pageContent[_currentIndex].name;
  }

  @override
  bool showLeftBack() {
    return false;
  }

  @override
  Widget? getBottomNavigationBar() {
    return BottomNavigationBar(
        // 当前菜单下标
        currentIndex: _currentIndex,
        // 点击事件,获取当前点击的标签下标
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // 图标大小
        iconSize: 30.0,
        // 选中图标的颜色
        fixedColor: Colors.red,
        // 配置底部可以有多个Tab标签页(5个时就需要)
        type: BottomNavigationBarType.fixed,
        items: _pageContent.map((data) {
          return BottomNavigationBarItem(
              icon: Icon(data.icon), label: data.name);
        }).toList());
  }
}
