import 'package:flutter/material.dart';

import '../../../../base/base_page_state.dart';
import '../../../../constants/dimen_constant.dart';
import '../../../widget/vip_tab_bar_view.dart';
import '../../../widget/vip_text.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/18
///INTRODUCE:TabBar组件效果页面

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<StatefulWidget> createState() => _TabBarPageState();
}

class _TabBarPageState extends BasePageState {
  @override
  Widget getBody(BuildContext context) {
    var tabs = ["条目一", "条目二", "条目三", "条目四", "条目五", "条目六", "条目七", "条目八"];
    var tabs2 = ["条目一", "条目二", "条目三"];
    var tabImages = [
      "https://www.vipandroid.cn/ming/pic/new_java.png",
      "https://www.vipandroid.cn/ming/pic/new_android.png",
      "https://www.vipandroid.cn/ming/pic/new_kotlin.png"
    ]; //图片指示器
    var bodyList = tabs
        .map((e) => VipText(e, backgroundColor: Colors.amberAccent))
        .toList();
    var bodyList2 = tabs2
        .map((e) => VipText(e, backgroundColor: Colors.amberAccent))
        .toList();
    return Column(children: [
      const VipText(
        "多个Tab滑动",
        alignment: Alignment.topLeft,
        marginTop: DimenConstant.dimen_10,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SizedBox(
          height: 80,
          child: VipTabBarView(
            tabTitleList: tabs,
            tabBodyList: bodyList,
          )),
      const VipText("固定Tab不滑动",
          alignment: Alignment.topLeft,
          marginTop: DimenConstant.dimen_10,
          style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(
          height: 80,
          child: VipTabBarView(
            tabTitleList: tabs2,
            tabBodyList: bodyList2,
            isScrollable: false,
          )),
      const VipText("修改指示器颜色",
          alignment: Alignment.topLeft,
          marginTop: DimenConstant.dimen_10,
          style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(
          height: 80,
          child: VipTabBarView(
            tabTitleList: tabs2,
            tabBodyList: bodyList2,
            isScrollable: false,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
          )),
      const VipText("修改指示器大小",
          alignment: Alignment.topLeft,
          marginTop: DimenConstant.dimen_10,
          style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(
          height: 80,
          child: VipTabBarView(
            tabTitleList: tabs2,
            tabBodyList: bodyList2,
            isScrollable: false,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
          )),
      const VipText("图片指示器",
          alignment: Alignment.topLeft,
          marginTop: DimenConstant.dimen_10,
          style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(
          height: 80,
          child: VipTabBarView(
            tabImageList: tabImages,
            tabBodyList: bodyList2,
            isScrollable: false,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
          )),
      const VipText("左图右文指示器",
          alignment: Alignment.topLeft,
          marginTop: DimenConstant.dimen_10,
          style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(
          height: 80,
          child: VipTabBarView(
            tabIconAndTextList: [
              VipTabBarBean(
                  "Java", "https://www.vipandroid.cn/ming/pic/new_java.png"),
              VipTabBarBean("Android",
                  "https://www.vipandroid.cn/ming/pic/new_android.png"),
              VipTabBarBean("Kotlin",
                  "https://www.vipandroid.cn/ming/pic/new_kotlin.png"),
            ],
            tabBodyList: bodyList2,
            isScrollable: false,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
          ))
    ]);
  }

  @override
  String getTitle() {
    return "TabBar";
  }
}
