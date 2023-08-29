import 'package:flutter/material.dart';

///AUTHOR:AbnerMing
///DATE:2023/8/16
///INTRODUCE:窗口弹出

class PopupWindow {
  //加到屏幕上
  static OverlayEntry? _overlayEntry;

  static void create(
    GlobalKey? key,
    Widget child, {
    double childWidth = 0.0, //子组件的宽
    double childHeight = 0.0, //子组件的高
    WindowDirection direction = WindowDirection.bottom,
    double left = 0.0,
    double top = 0.0,
    double margin = 0.0,
  }) {
    if (key == null) {
      return;
    }

    var size = getWidgetSize(key); //获取在目标组件的位置

    double widgetTop = 0.0;
    double widgetLeft = 0.0;
    switch (direction) {
      case WindowDirection.bottom: //下面
        widgetTop = size.bottom + margin;
        widgetLeft =
            size.right - childWidth / 2 - ((size.right - size.left) / 2);
        break;
      case WindowDirection.left: //左面
        widgetTop =
            size.bottom - childHeight / 2 - ((size.bottom - size.top) / 2);
        widgetLeft = size.left - childWidth - margin;
        break;
      case WindowDirection.top: //上面
        widgetTop = size.top - childHeight - margin;
        widgetLeft =
            size.right - childWidth / 2 - ((size.right - size.left) / 2);
        break;
      case WindowDirection.right: //右面
        widgetTop =
            size.bottom - childHeight / 2 - ((size.bottom - size.top) / 2);
        widgetLeft = size.right + margin;
        break;
      case WindowDirection.topLeft: //左上
        widgetTop =
            size.bottom - childHeight - (size.bottom - size.top) - margin;
        widgetLeft = size.left - childWidth - margin;
        break;
      case WindowDirection.topRight: //右上
        widgetTop =
            size.bottom - childHeight - (size.bottom - size.top) - margin;
        widgetLeft = size.right + margin;
        break;
      case WindowDirection.bottomLeft: //左下
        widgetTop = size.bottom + margin;
        widgetLeft = size.left - childWidth - margin;
        break;
      case WindowDirection.bottomRight: //右下
        widgetTop = size.bottom + margin;
        widgetLeft = size.right + margin;

        break;
      case WindowDirection.none: //取消 自己测量位置
        widgetTop = top;
        widgetLeft = left;
        break;
    }

    //获取OverlayState
    OverlayState overlayState = Overlay.of(key.currentContext!);
    if (_overlayEntry == null) {
      //通过OverlayEntry将构建的布局插入到整个布局的最上层
      _overlayEntry = OverlayEntry(
          builder: (BuildContext context) => GestureDetector(
              onTap: () {
                hint();
              },
              child: Container(
                  color: Colors.transparent,
                  child: Material(
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Positioned(
                          top: widgetTop,
                          left: widgetLeft,
                          child: child,
                        )
                      ],
                    ),
                  ))));
      //插入到整个布局的最上层
      overlayState.insert(_overlayEntry!);
    } else {
      //重新绘制UI，类似setState
      _overlayEntry?.markNeedsBuild();
    }
  }

  ///获取组件的位置
  static WidgetSize getWidgetSize(GlobalKey key) {
    //获取组件的位置，在左上右下
    final RenderBox renderBox =
        (key.currentContext?.findRenderObject() as RenderBox);
    final left = renderBox.localToGlobal(Offset.zero).dx; //左边
    final top = renderBox.localToGlobal(Offset(renderBox.size.width, 0)).dy;
    final bottom = renderBox.localToGlobal(Offset(0, renderBox.size.height)).dy;
    final right = renderBox
        .localToGlobal(Offset(renderBox.size.width, renderBox.size.height))
        .dx;
    return WidgetSize(left, top, right, bottom);
  }

  ///隐藏
  static void hint() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

///组件对象，标记左上右下
class WidgetSize {
  double left;
  double top;
  double right;
  double bottom;

  WidgetSize(this.left, this.top, this.right, this.bottom);
}

///弹出方向
enum WindowDirection {
  left,
  top,
  right,
  bottom,
  topLeft, //左上角
  topRight, //右上角
  bottomLeft, //左下
  bottomRight, //右下
  none,
}
