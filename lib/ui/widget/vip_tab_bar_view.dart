import 'package:flutter/material.dart';

import '../../constants/dimen_constant.dart';
import 'vip_text.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/18
///INTRODUCE:TabBar组件

class VipTabBarView extends StatefulWidget {
  final List<String>? tabTitleList; //tab指示器的标题集合,文字形式
  final List<String>? tabImageList; //tab指示器的标题集合,图片形式
  final List<Widget>? tabWidgetList; //tab指示器的标题集合,Widget形式
  final List<VipTabBarBean>? tabIconAndTextList; //tab指示器的标题集合,左图右文形式
  final List<Widget>? tabBodyList; //tab指示器的页面
  final Function(int)? onPageChange; //页面滑动回调
  final Color? indicatorColor; //指示器的颜色
  final Color? labelColor; //标签的颜色
  final Color? unselectedLabelColor; //未选中标签的颜色
  final TabBarIndicatorSize? indicatorSize; //指示器的大小 是和文字宽度一样还是充满
  final double? indicatorHeight; //指示器的高度
  final bool? isScrollable; //指示器是否支持滑动
  final double? tabImageWidth; //图片指示器的宽 仅用于图片指示器和图文指示器
  final double? tabImageHeight; //图片指示器的高 仅用于图片指示器和图文指示器
  final double? tabIconAndTextMargin; //左图右文指示器，icon距离文字的距离
  final double? tabHeight; //tab高度

  const VipTabBarView(
      {this.tabTitleList,
      this.tabImageList,
      this.tabWidgetList,
      this.tabIconAndTextList,
      this.tabBodyList,
      this.onPageChange,
      this.indicatorColor = Colors.black,
      this.labelColor = Colors.black,
      this.unselectedLabelColor = Colors.grey,
      this.indicatorSize = TabBarIndicatorSize.tab,
      this.indicatorHeight = 2,
      this.isScrollable = true,
      this.tabImageWidth = DimenConstant.dimen_15,
      this.tabImageHeight = DimenConstant.dimen_15,
      this.tabIconAndTextMargin = DimenConstant.dimen_5,
      this.tabHeight = DimenConstant.dimen_44,
      super.key});

  @override
  State<VipTabBarView> createState() => _VipTabBarViewState();
}

///左图右文的对象
class VipTabBarBean {
  String title;
  String icon;

  VipTabBarBean(this.title, this.icon);
}

class _VipTabBarViewState extends State<VipTabBarView>
    with SingleTickerProviderStateMixin {
  // 标签控制器
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 定义控制器
    _tabController = TabController(
      vsync: this,
      length: widget.tabBodyList != null ? widget.tabBodyList!.length : 0,
    );
    // 添加监听事件
    _tabController.addListener(() {
      //滑动的索引
      if (widget.onPageChange != null) {
        widget.onPageChange!(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // 杀死控制器
    _tabController.dispose();
  }

  /*
   * 指示器点击
   */
  void onPage(position) {}

  @override
  Widget build(BuildContext context) {
    List<Widget> tabList = []; //tab指示器
    List<Widget> bodyList = []; //tab指示器对应的页面
    //文字形式
    if (widget.tabTitleList != null) {
      tabList = widget.tabTitleList!
          .map((e) => Tab(
                text: e,
                height: widget.tabHeight,
              ))
          .toList();
    }
    //图片形式
    if (widget.tabImageList != null) {
      tabList = widget.tabImageList!.map((e) {
        Widget view;
        if (e.contains("http")) {
          //网络图片
          view = Image.network(
            e,
            width: widget.tabImageWidth,
            height: widget.tabImageHeight,
          );
        } else {
          view = Image.asset(
            e,
            width: widget.tabImageWidth,
            height: widget.tabImageHeight,
          );
        }
        return Tab(icon: view, height: widget.tabHeight);
      }).toList();
    }
    //自定义Widget
    if (widget.tabWidgetList != null) {
      tabList = widget.tabWidgetList!;
    }
    //左图右文形式
    if (widget.tabIconAndTextList != null) {
      tabList = widget.tabIconAndTextList!.map((e) {
        return VipText(
          e.title,
          leftIcon: e.icon,
          height: widget.tabHeight,
          leftIconWidth: widget.tabImageWidth,
          leftIconHeight: widget.tabImageHeight,
          iconMarginRight: widget.tabIconAndTextMargin,
        );
      }).toList();
    }

    //指示器对应的页面
    if (widget.tabBodyList != null) {
      bodyList = widget.tabBodyList!.map((e) => e).toList();
    }

    return Scaffold(
      appBar: TabBar(
        // 加上控制器
        controller: _tabController,
        tabs: tabList,
        // 标签指示器的颜色
        indicatorColor: widget.indicatorColor,
        // 标签的颜色
        labelColor: widget.labelColor,
        // 未选中标签的颜色
        unselectedLabelColor: widget.unselectedLabelColor,
        // 指示器的大小
        indicatorSize: widget.indicatorSize,
        // 指示器的权重，即线条高度
        indicatorWeight: widget.indicatorHeight!,
        // 多个标签时滚动加载
        isScrollable: widget.isScrollable!,
        onTap: onPage,
      ),
      body: TabBarView(
        // 加上控制器
        controller: _tabController,
        children: bodyList,
      ),
    );
  }
}
