import 'package:flutter/material.dart';

import '../constants/image_constant.dart';
import '../constants/toast_type.dart';
import '../ui/widget/vip_btn_rotate_animate.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/12
///INTRODUCE:Toast提示

class Toast {
  // toast靠它加到屏幕上
  static OverlayEntry? _overlayEntry;

  // toast是否正在showing
  static bool _showing = false;

  // 开启一个新toast的当前时间，用于对比是否已经展示了足够时间
  static var _startedTime = DateTime.now();

  // 提示内容
  static String _msg = "";

  // toast显示时间
  static int _showTime = 1000;

  // 背景颜色
  static var _bgColor = Colors.black;

  // 文本颜色
  static var _textColor = Colors.white;

  // 文字大小
  static var _textSize = 14.0;

  // 显示位置
  static var _toastPosition = ToastPosition.bottom;

  // 左右边距
  static var _pdHorizontal = 24.0;

  // 上下边距
  static var _pdVertical = 10.0;

  // icon地址，可以是http，本地
  static var _iconPath = "";

  //icon成功提示
  static var _iconPrompt = ToastPrompt.none;

  //icon的位置
  static ToastIconPosition _iconPosition = ToastIconPosition.top;

  //设置toast 宽
  static double? _toastWidth;

  //设置toast 高
  static double? _toastHeight;

  //设置toast icon 宽 适用于单独设置icon
  static double? _toastIconWidth;

  //设置toast icon 高 适用于单独设置icon
  static double? _toastIconHeight;

  static void toast(
    BuildContext context, {
    //显示的文本
    String msg = "",
    //显示的时间 单位毫秒
    int showTime = 2000,
    //显示的背景
    Color bgColor = Colors.black,
    //显示的文本颜色
    Color textColor = Colors.white,
    //显示的文字大小
    double textSize = 14.0,
    //显示的位置
    ToastPosition position = ToastPosition.bottom,
    //文字水平方向的内边距
    double pdHorizontal = 24.0,
    //文字垂直方向的内边距
    double pdVertical = 10.0,
    //icon地址
    String iconPath = "",
    ToastPrompt toastPrompt = ToastPrompt.none,
    //icon的显示的位置
    ToastIconPosition iconPosition = ToastIconPosition.top,
    //Toast 宽
    double? toastWidth,
    //Toast 高
    double? toastHeight,
    //Toast icon宽
    double? toastIconWidth = 20,
    //Toast icon高
    double? toastIconHeight = 20,
  }) async {
    _msg = msg;
    _startedTime = DateTime.now();
    _showTime = showTime;
    _bgColor = bgColor;
    _textColor = textColor;
    _textSize = textSize;
    _toastPosition = position;
    _pdHorizontal = pdHorizontal;
    _pdVertical = pdVertical;
    _iconPath = iconPath;
    _iconPrompt = toastPrompt;
    _iconPosition = iconPosition;
    _toastWidth = toastWidth;
    _toastHeight = toastHeight;
    _toastIconWidth = toastIconWidth;
    _toastIconHeight = toastIconHeight;
    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    _showing = true;
    if (_overlayEntry == null) {
      //OverlayEntry负责构建布局
      //通过OverlayEntry将构建的布局插入到整个布局的最上层
      _overlayEntry = OverlayEntry(
          builder: (BuildContext context) => Positioned(
                //top值，可以改变这个值来改变toast在屏幕中的位置
                top: buildToastPosition(context),
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: AnimatedOpacity(
                        opacity: _showing ? 1.0 : 0.0, //目标透明度
                        duration: _showing
                            ? const Duration(milliseconds: 100)
                            : const Duration(milliseconds: 400),
                        child: _buildToastWidget(),
                      ),
                    )),
              ));
      //插入到整个布局的最上层
      overlayState.insert(_overlayEntry!);
    } else {
      //重新绘制UI，类似setState
      _overlayEntry?.markNeedsBuild();
    }
    // 等待时间
    await Future.delayed(Duration(milliseconds: _showTime));
    //2秒后 到底消失不消失
    if (DateTime.now().difference(_startedTime).inMilliseconds >= _showTime) {
      _showing = false;
      _overlayEntry?.markNeedsBuild();
      await Future.delayed(const Duration(milliseconds: 400));
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  //toast绘制
  static _buildToastWidget() {
    return Container(
        width: _toastWidth,
        height: _toastHeight,
        decoration: BoxDecoration(
            color: _bgColor,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        padding: EdgeInsets.symmetric(
            horizontal: _pdHorizontal, vertical: _pdVertical),
        child: (_iconPrompt != ToastPrompt.none || _iconPath != "")
            ? getIconText()
            : getText());
  }

  static Widget getIconText() {
    Widget widget = Column(children: [getIcon(), getText()]);
    switch (_iconPosition) {
      case ToastIconPosition.left: //左
        widget = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [getIcon(), getText()]);
        break;
      case ToastIconPosition.top: //上
        widget = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [getIcon(), getText()]);
        break;
      case ToastIconPosition.right: //右
        widget = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [getText(), getIcon()]);
        break;
      case ToastIconPosition.bottom: //下
        widget = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [getText(), getIcon()]);
        break;
    }
    return widget;
  }

  static Widget getIcon() {
    if (_iconPath != "") {
      Widget image;
      //是图片
      if (_iconPath.contains("http")) {
        //包含
        image = Image.network(
          _iconPath,
          width: _toastIconWidth,
          height: _toastIconHeight,
        );
      } else {
        image = Image.asset(
          _iconPath,
          width: _toastIconWidth,
          height: _toastIconHeight,
        );
      }
      return image;
    }

    //单独加载loading
    if (_iconPrompt == ToastPrompt.loading) {
      return const VipBtnRotateAnimate(imagePath: ImageConstant.buttonProgress);
    }
    IconData icon = Icons.done;
    if (_iconPrompt == ToastPrompt.error) {
      icon = Icons.close;
    } else if (_iconPrompt == ToastPrompt.warn) {
      icon = Icons.priority_high_rounded;
    }
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Colors.white)),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(bottom: 8),
        child: Icon(
          icon,
          size: 14,
          color: Colors.white,
        ));
  }

  /*
  * 文本提示框
  * */
  static Widget getText() {
    return Text(
      _msg,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: _textSize,
          color: _textColor,
          decoration: TextDecoration.none),
    );
  }

/*
* 设置toast位置
* */
  static buildToastPosition(context) {
    var height = MediaQuery.of(context).size.height;
    double backResult;
    if (_toastPosition == ToastPosition.top) {
      backResult = height / 6;
    } else if (_toastPosition == ToastPosition.center) {
      backResult = height / 2;
    } else {
      backResult = (height / 6) * 5;
    }
    return backResult;
  }
}
