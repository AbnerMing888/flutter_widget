import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';
import '../../utils/hex_color.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/15
///INTRODUCE:自定义虚线边框

class DashedBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true //抗锯齿
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke //fill填充,stroke线框
      ..color = HexColor(ColorConstant.color_74d1d7); //颜色

    var rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawDashLine(rect.topLeft, rect.topRight, 4, 4, paint);
    canvas.drawDashLine(rect.topLeft, rect.bottomLeft, 4, 4, paint);
    canvas.drawDashLine(rect.topRight, rect.bottomRight, 4, 4, paint);
    canvas.drawDashLine(rect.bottomLeft, rect.bottomRight, 4, 4, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 画布是否需要重绘，false的话，则第一次绘制结束后不可再改变
    return false;
  }

}

///
/// Canvas扩展函数
/// @Author weitianpeng
/// @Create 2021-3-28
///
extension CanvasExt on Canvas {
  ///绘制虚线
  ///[p1] 起点
  ///[p2] 终点
  ///[dashWidth] 实线宽度
  ///[spaceWidth] 空隙宽度
  void drawDashLine(
    Offset p1,
    Offset p2,
    double dashWidth,
    double spaceWidth,
    Paint paint,
  ) {
    assert(dashWidth > 0);
    assert(spaceWidth > 0);

    double radians;

    if (p1.dx == p2.dx) {
      radians = (p1.dy < p2.dy) ? pi / 2 : pi / -2;
    } else {
      radians = atan2(p2.dy - p1.dy, p2.dx - p1.dx);
    }

    save();
    translate(p1.dx, p1.dy);
    rotate(radians);

    var matrix = Matrix4.identity();
    matrix.translate(p1.dx, p1.dy);
    matrix.rotateZ(radians);
    matrix.invert();

    var endPoint = MatrixUtils.transformPoint(matrix, p2);

    double tmp = 0;
    double length = endPoint.dx;
    double delta;

    while (tmp < length) {
      delta = (tmp + dashWidth < length) ? dashWidth : length - tmp;
      drawLine(Offset(tmp, 0), Offset(tmp + delta, 0), paint);
      if (tmp + delta >= length) {
        break;
      }

      tmp = (tmp + dashWidth + spaceWidth < length)
          ? (tmp + dashWidth + spaceWidth)
          : (length);
    }

    restore();
  }

  ///绘制虚线
  ///[rect] 矩形
  ///[dashWidth] 实线宽度
  ///[spaceWidth] 空隙宽度
  void drawDashRect(
    Rect rect,
    double dashWidth,
    double spaceWidth,
    Paint paint,
  ) {
    drawDashLine(rect.topLeft, rect.topRight, dashWidth, spaceWidth, paint);
    drawDashLine(rect.topRight, rect.bottomRight, dashWidth, spaceWidth, paint);
    drawDashLine(
        rect.bottomRight, rect.bottomLeft, dashWidth, spaceWidth, paint);
    drawDashLine(rect.bottomLeft, rect.topLeft, dashWidth, spaceWidth, paint);
  }
}
