import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../base/base_widget.dart';
import '../../constants/dimen_constant.dart';
import '../../data/bean/text_rich_bean.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/11
///INTRODUCE:文本控件 Text

class VipText extends BaseWidget {
  final String text; //文本内容
  final TextStyle? style; //文本样式
  final String? leftIcon; //左边的图片
  final double? leftIconWidth; //左边的图片宽度
  final double? leftIconHeight; //左边的图片高度
  final double? iconMarginRight; //图片距离右边的文字距离
  final String? rightIcon; //右边的图片
  final double? rightIconWidth; //右边的图片宽度
  final double? rightIconHeight; //右边的图片高度
  final double? iconMarginLeft; //图片距离左边的文字距离
  final String? topIcon; //上边的图片
  final double? topIconWidth; //上边的图片宽度
  final double? topIconHeight; //上边的图片高度
  final double? iconMarginBottom; //图片距离下边的文字距离
  final String? bottomIcon; //下边的图片
  final double? bottomIconWidth; //下边的图片宽度
  final double? bottomIconHeight; //下边的图片高度
  final double? iconMarginTop; //图片距离上边的文字距离
  final MainAxisAlignment? mainAxisAlignment; //文字的位置
  final TextOverflow? textOverflow; //文字溢出方式
  final TextAlign? textAlign; //文字位置
  final int? maxLines; //最大行数
  final List<TextRichBean>? richList; //富文本数据
  final Function(int, TextRichBean)? onRichClick; //富文本点击事件

  const VipText(this.text,
      {super.key,
      this.style,
      this.leftIcon,
      this.leftIconWidth = DimenConstant.dimen_22,
      this.leftIconHeight = DimenConstant.dimen_22,
      this.iconMarginRight = 0,
      this.rightIcon,
      this.rightIconWidth = DimenConstant.dimen_22,
      this.rightIconHeight = DimenConstant.dimen_22,
      this.iconMarginLeft = 0,
      this.topIcon,
      this.topIconWidth = DimenConstant.dimen_22,
      this.topIconHeight = DimenConstant.dimen_22,
      this.iconMarginBottom = 0,
      this.bottomIcon,
      this.bottomIconWidth = DimenConstant.dimen_22,
      this.bottomIconHeight = DimenConstant.dimen_22,
      this.iconMarginTop = 0,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.textOverflow,
      this.textAlign,
      this.maxLines,
      this.richList,
      this.onRichClick,
      super.width,
      super.height,
      super.margin,
      super.marginLeft,
      super.marginTop,
      super.marginRight,
      super.marginBottom,
      super.padding,
      super.paddingLeft,
      super.paddingTop,
      super.paddingRight,
      super.paddingBottom,
      super.backgroundColor,
      super.strokeWidth,
      super.strokeColor,
      super.solidColor,
      super.radius,
      super.isCircle,
      super.leftTopRadius,
      super.rightTopRadius,
      super.leftBottomRadius,
      super.rightBottomRadius,
      super.childWidget,
      super.alignment,
      super.onClick,
      super.onDoubleClick,
      super.onLongPress});

  /*
  * 返回图片的组件
  * */
  Widget getImageWidget(String icon, double width, double height) {
    if (icon.contains("http")) {
      return Image.network(icon, width: width, height: height);
    } else {
      return Image.asset(icon, width: width, height: height);
    }
  }

  @override
  Widget getWidget(BuildContext context) {
    List<Widget> widgets = [];
    //左边的Icon
    if (leftIcon != null) {
      widgets.add(getImageWidget(leftIcon!, leftIconWidth!, leftIconHeight!));
    }
    //水平中间的文字
    if (leftIcon != null || rightIcon != null) {
      widgets.add(Container(
        margin: EdgeInsets.only(left: iconMarginRight!, right: iconMarginLeft!),
        child: getTextWidget(),
      ));
    }

    //右边的Icon
    if (rightIcon != null) {
      widgets
          .add(getImageWidget(rightIcon!, rightIconWidth!, rightIconHeight!));
    }

    if (widgets.isNotEmpty) {
      return Row(
        mainAxisAlignment: mainAxisAlignment!,
        children: widgets,
      );
    }

    //上边的icon
    if (topIcon != null) {
      widgets.add(getImageWidget(topIcon!, topIconWidth!, topIconHeight!));
    }
    //垂直中间的文字
    if (topIcon != null || bottomIcon != null) {
      widgets.add(Container(
        margin: EdgeInsets.only(top: iconMarginBottom!, bottom: iconMarginTop!),
        child: getTextWidget(),
      ));
    }
    //下面的icon
    if (bottomIcon != null) {
      widgets.add(
          getImageWidget(bottomIcon!, bottomIconWidth!, bottomIconHeight!));
    }
    if (widgets.isNotEmpty) {
      return Column(
        mainAxisAlignment: mainAxisAlignment!,
        children: widgets,
      );
    }

    //富文本
    if (richList != null && richList!.isNotEmpty) {
      List<TextSpan> list = [];
      for (var a = 0; a < richList!.length; a++) {
        var richBean = richList![a];
        var textSpan = TextSpan(
            text: richBean.text,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //点击事件
                if (onRichClick != null) {
                  onRichClick!(a, richBean);
                }
              },
            style: TextStyle(
                fontSize: richBean.textSize, color: richBean.textColor));
        list.add(textSpan);
      }
      //富文本
      return Text.rich(TextSpan(children: list));
    }
    return getTextWidget();
  }

  Widget getTextWidget() {
    return Text(
      text,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: style,
    );
  }
}
