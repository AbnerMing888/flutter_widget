import 'package:flutter/cupertino.dart';

import '../../constants/dimen_constant.dart';
import '../../constants/image_constant.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/15
///INTRODUCE:loading旋转动画组件

class VipBtnRotateAnimate extends StatefulWidget {
  final String? imagePath;

  const VipBtnRotateAnimate({super.key, this.imagePath});

  @override
  State<VipBtnRotateAnimate> createState() => _VipBtnRotateAnimateState();
}

class _VipBtnRotateAnimateState extends State<VipBtnRotateAnimate>
    with SingleTickerProviderStateMixin {

  _VipBtnRotateAnimateState();

  // 会重复播放的控制器
  late final AnimationController _repeatController;

  // 线性动画
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // 动画持续时间是 3秒，此处的this指 TickerProviderStateMixin
    _repeatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(); // 设置动画重复播放

    // 创建一个从0到360弧度的补间动画 v * 2 * π
    _animation = Tween<double>(begin: 0, end: 1).animate(_repeatController);
  }

  @override
  void dispose() {
    _repeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String imageSrc = ImageConstant.buttonProgress;
    if (widget.imagePath != null) {
      imageSrc = widget.imagePath!;
    }
    return RotationTransition(
      turns: _animation,
      child: Image.asset(imageSrc,
          width: DimenConstant.dimen_22, height: DimenConstant.dimen_22),
    );
  }
}
