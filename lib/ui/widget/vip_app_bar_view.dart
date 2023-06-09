import 'package:flutter/material.dart';

import 'vip_text.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/17
///INTRODUCE:AppBar组件

class VipAppBarView extends AppBar {
  final VoidCallback? onLeftClick; //点击事件
  final double? barHeight; //标题栏的高度
  final String barTitle; //标题
  final Color? barTitleColor; //标题颜色
  final double? barTitleSize; //标题大小
  final bool? barTitleBold; //标题是否加粗
  final bool? barCenterTitle; //标题位置
  final String? barLeftIcon; //左边的Icon
  final Color? barBackgroundColor; //背景颜色
  final List<Widget>? barRightListMenu; //右边的按钮
  final String? barRightMenuText; //右边的文字按钮
  final String? barRightMenuImage; //右边的图片按钮
  final VoidCallback? onRightMenuTextClick; //右边点击事件
  final VoidCallback? onRightMenuImageClick; //右边图片点击事件
  final Color? barRightMenuTextColor; //右边文字按钮颜色
  final double? barRightMenuTextSize; //右边文字按钮大小
  final bool? barRightMenuTextBold; //右边文字按钮是否加粗
  final bool? barIsClose; //左边关闭按钮
  final String? barLeftClose; //左边的关闭Icon
  final VoidCallback? onLeftCloseClick; //左侧关闭事件

  VipAppBarView(this.barTitle,
      {this.onLeftClick,
      this.barHeight = 44,
      this.barCenterTitle = true,
      this.barTitleColor = Colors.white,
      this.barTitleSize = 16,
      this.barLeftIcon,
      this.barTitleBold = false,
      this.barBackgroundColor,
      this.barRightListMenu,
      this.barRightMenuText,
      this.onRightMenuTextClick,
      this.barRightMenuImage,
      this.onRightMenuImageClick,
      this.barRightMenuTextColor = Colors.white,
      this.barRightMenuTextSize = 14,
      this.barRightMenuTextBold = false,
      this.barIsClose = false,
      this.barLeftClose,
      this.onLeftCloseClick,
      super.key});

  /*
  * 标题
  * */
  @override
  Widget? get title => VipText(barTitle,
      style: TextStyle(
          color: barTitleColor,
          fontSize: barTitleSize,
          fontWeight: barTitleBold! ? FontWeight.bold : FontWeight.normal));

  /*
  * 标题是否居中
  * */
  @override
  bool? get centerTitle => barCenterTitle;

  @override
  double? get toolbarHeight => barHeight;

  /*
  * 左边的icon
  * */
  @override
  Widget? get leading => getLeftWidget();

  /*
  * 右边的按钮
  * */

  @override
  List<Widget>? get actions => getRightMenu();

  /*
  * 背景颜色
  * */
  @override
  Color? get backgroundColor => barBackgroundColor;

  /*
  * 返回右边的按钮
  * */
  List<Widget>? getRightMenu() {
    List<Widget> widgets = [];
    if (barRightMenuText != null) {
      widgets.add(IconButton(
        icon: VipText(barRightMenuText!,
            style: TextStyle(
                color: barRightMenuTextColor,
                fontSize: barRightMenuTextSize,
                fontWeight: barRightMenuTextBold!
                    ? FontWeight.bold
                    : FontWeight.normal)),
        onPressed: onRightMenuTextClick,
      ));
    }
    if (barRightMenuImage != null) {
      widgets.add(IconButton(
        icon: Image.asset(barRightMenuImage!),
        onPressed: onRightMenuImageClick,
      ));
    }
    //添加全部
    if (barRightListMenu != null) {
      widgets.addAll(barRightListMenu!);
    }
    return widgets;
  }

  /*
  * 返回左边的icon
  * */
  Widget getLeftWidget() {
    List<Widget> leftWidgets = [];

    leftWidgets.add(Expanded(
        flex: 1,
        child: IconButton(
          icon: barLeftIcon != null
              ? Image.asset(barLeftIcon!)
              : const Icon(Icons.arrow_back_ios),
          onPressed: onLeftClick,
        )));

    if (barIsClose!) {
      //需要关闭按钮
      leftWidgets.add(Expanded(
          flex: 1,
          child: IconButton(
            icon: barLeftClose != null
                ? Image.asset(barLeftClose!)
                : const Icon(Icons.close),
            onPressed: onLeftCloseClick,
          )));
    }
    return Row(
      children: leftWidgets,
    );
  }
}
