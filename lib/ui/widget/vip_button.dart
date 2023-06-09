import 'package:flutter/material.dart';

import '../../base/base_widget.dart';
import '../../constants/dimen_constant.dart';
import 'vip_btn_rotate_animate.dart';
import 'vip_text.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/11
///INTRODUCE:Button Widget

class VipButton extends BaseWidget {
  final String text; //文字
  final TextStyle? style; //文字样式
  final bool? isLeftLoading; //是否开启左边的loading
  final String? leftLoadingImage; //左边的loading图片
  final String? leftIcon; //左边的图片
  final double? leftIconWidth; //左边的图片宽度
  final double? leftIconHeight; //左边的图片高度
  final double? iconMarginRight; //图片距离右边的距离
  const VipButton(this.text,
      {super.key,
      this.style,
      this.isLeftLoading,
      this.leftLoadingImage,
      this.leftIcon,
      this.leftIconWidth,
      this.leftIconHeight,
      this.iconMarginRight,
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
      super.gradient,
      super.gradientBegin,
      super.gradientEnd,
      super.gradientColorList,
      super.gradientColorStops,
      super.onClick,
      super.onDoubleClick,
      super.onLongPress});

  @override
  Widget getWidget(BuildContext context) {
    List<Widget> widgets = [];
    if (isLeftLoading == true) {
      //需要加载左边的loading
      widgets.add(VipBtnRotateAnimate(imagePath: leftLoadingImage));
    }
    //左边的Icon
    if (leftIcon != null) {
      widgets.add(Image.asset(leftIcon!,
          width: leftIconWidth ?? DimenConstant.dimen_22,
          height: leftIconHeight ?? DimenConstant.dimen_22));
    }
    widgets.add(VipText(
      text,
      marginLeft: iconMarginRight ?? DimenConstant.dimen_10,
      style: style,
    ));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }
}
