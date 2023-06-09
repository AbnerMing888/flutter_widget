import 'package:flutter/material.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/11
///INTRODUCE:控件无状态基类

class BaseWidget extends StatelessWidget {
  final VoidCallback? onClick; //点击事件
  final VoidCallback? onDoubleClick; //双击事件
  final VoidCallback? onLongPress; //长按事件
  final double? width; //宽度
  final double? height; //高度
  final double? margin; //外边距，左上右下
  final double? marginLeft; //外边距，距离左边
  final double? marginTop; //外边距，距离上边
  final double? marginRight; //外边距，距离右边
  final double? marginBottom; //外边距，距离下边
  final double? padding; //内边距，左上右下
  final double? paddingLeft; //内边距，距离左边
  final double? paddingTop; //内边距，距离上边
  final double? paddingRight; //内边距，距离右边
  final double? paddingBottom; //内边距，距离下边
  final Color? backgroundColor; //背景颜色 和 decoration 二者取其一
  final double? strokeWidth; //背景边框统一的宽度
  final Color? strokeColor; //背景边框的颜色
  final Color? solidColor; //背景填充颜色
  final double? radius; //背景的角度
  final bool? isCircle; //背景是否是圆形
  final double? leftTopRadius; //背景左上角度
  final double? rightTopRadius; //背景 右上角度
  final double? leftBottomRadius; //背景 左下角度
  final double? rightBottomRadius; //背景 右下角度
  final Widget? childWidget; //子控件
  final Alignment? alignment; //位置
  final int? gradient; //渐变方式，为支持后续拓展，用int类型
  final List<Color>? gradientColorList; //渐变颜色
  final List<double>? gradientColorStops; //颜色值梯度，取值范围[0,1]
  final Alignment? gradientBegin; //渐变起始位置
  final Alignment? gradientEnd; //渐变结束位置

  //边框的颜色
  const BaseWidget(
      {super.key,
      this.width,
      this.height,
      this.margin,
      this.marginLeft,
      this.marginTop,
      this.marginRight,
      this.marginBottom,
      this.padding,
      this.paddingLeft,
      this.paddingTop,
      this.paddingRight,
      this.paddingBottom,
      this.backgroundColor,
      this.strokeWidth,
      this.strokeColor,
      this.solidColor,
      this.radius,
      this.isCircle,
      this.leftTopRadius,
      this.rightTopRadius,
      this.leftBottomRadius,
      this.rightBottomRadius,
      this.childWidget,
      this.alignment,
      this.gradient,
      this.gradientColorList,
      this.gradientColorStops,
      this.gradientBegin,
      this.gradientEnd,
      this.onClick,
      this.onDoubleClick,
      this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        highlightColor: Colors.transparent,
        // 透明色
        splashColor: Colors.transparent,
        // 透明色
        onTap: onClick,
        onDoubleTap: onDoubleClick,
        onLongPress: onLongPress,
        child: Container(
          width: width,
          height: height,
          alignment: alignment,
          margin: margin != null
              ? EdgeInsets.all(margin!)
              : EdgeInsets.only(
                  left: marginLeft != null ? marginLeft! : 0,
                  top: marginTop != null ? marginTop! : 0,
                  right: marginRight != null ? marginRight! : 0,
                  bottom: marginBottom != null ? marginBottom! : 0),
          padding: padding != null
              ? EdgeInsets.all(padding!)
              : EdgeInsets.only(
                  left: paddingLeft != null ? paddingLeft! : 0,
                  top: paddingTop != null ? paddingTop! : 0,
                  right: paddingRight != null ? paddingRight! : 0,
                  bottom: paddingBottom != null ? paddingBottom! : 0,
                ),
          color: backgroundColor,
          decoration: backgroundColor != null ? null : getDecoration(),
          child: childWidget ?? getWidget(context),
        ));
  }

  /*
  * 获取Decoration
  * */
  Decoration? getDecoration() {
    BorderRadiusGeometry? borderRadiusGeometry;
    if (radius != null) {
      //所有的角度
      borderRadiusGeometry = BorderRadius.all(Radius.circular(radius!));
    } else {
      //否则就是，各个角度
      borderRadiusGeometry = BorderRadius.only(
          topLeft: Radius.circular(leftTopRadius != null ? leftTopRadius! : 0),
          topRight:
              Radius.circular(rightTopRadius != null ? rightTopRadius! : 0),
          bottomLeft:
              Radius.circular(leftBottomRadius != null ? leftBottomRadius! : 0),
          bottomRight: Radius.circular(
              rightBottomRadius != null ? rightBottomRadius! : 0));
    }
    Gradient? tGradient;
    if (gradient != null) {
      tGradient = LinearGradient(
        colors: gradientColorList != null ? gradientColorList! : [],
        // 设置有哪些渐变色
        begin: gradientBegin != null ? gradientBegin! : Alignment.centerLeft,
        // 渐变色开始的位置，默认 centerLeft
        end: gradientEnd != null ? gradientEnd! : Alignment.centerRight,
        // 渐变色结束的位置，默认 centerRight
        stops: gradientColorStops, // 颜色值梯度，取值范围[0,1]，长度要和 colors 的长度一样
      );
    }
    Decoration? widgetDecoration = BoxDecoration(
      gradient: tGradient,
      //背景颜色
      color: solidColor != null ? solidColor! : Colors.transparent,
      //圆角半径
      borderRadius: isCircle == true ? null : borderRadiusGeometry,
      //是否是圆形
      shape: isCircle == true ? BoxShape.circle : BoxShape.rectangle,
      //边框线宽、颜色
      border: Border.all(
          width: strokeWidth != null ? strokeWidth! : 0,
          color: strokeColor != null ? strokeColor! : Colors.transparent),
    );
    return widgetDecoration;
  }

  /*
  * 获取控件
  * */
  Widget? getWidget(BuildContext context) {
    return null;
  }
}
