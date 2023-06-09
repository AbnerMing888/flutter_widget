import 'dart:async';
import 'package:flutter/material.dart';

import '../../constants/image_constant.dart';
import 'vip_text.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/22
///INTRODUCE:Banner组件
///自定义须知，手势滑动时，取消定时，手势抬起，重新定时
class VipBanner extends StatefulWidget {
  final List<String>? imageList; //图片地址
  final List<String>? titleList; //标题集合
  final double? radius; //图片圆角
  final double? height; //图片高度
  final double? imageMarginLeft; //图片距离左边的距离
  final double? imageMarginTop; //图片距离上边的距离
  final double? imageMarginRight; //图片距离右边的距离
  final double? imageMarginBottom; //图片距离下边的距离
  final double? imageMargin; //图片距离左上右下的距离
  final double? marginLeft; //距离左边的距离
  final double? marginTop; //距离上边的距离
  final double? marginRight; //距离右边的距离
  final double? marginBottom; //距离下边的距离
  final double? margin; //距离左上右下边的距离
  final double? indicatorMarginBottom; //指示器距离底部的距离
  final double? indicatorMarginRight; //指示器距离右边的距离
  final double? indicatorMarginLeft; //指示器距离左边的距离
  final Color? indicatorSelectColor; //指示器选中的颜色
  final Color? indicatorUnSelectColor; //指示器未选中的颜色
  final double? indicatorWidth; //指示器宽
  final double? indicatorHeight; //指示器高
  final double? indicatorUnWidth; //指示器未选中宽
  final double? indicatorUnHeight; //指示器未选中高
  final double? indicatorMargin; //指示器边距
  final IndicatorType? indicatorType; //指示器类型
  final double? indicatorRadius; //指示器圆角度数
  final bool? indicatorBannerBottom; //指示器位置，是在banner上还是Banner下
  final Color? indicatorBottomColor; //指示器在Banner下的背景，默认是透明
  final double? indicatorBottomHeight; //指示器在Banner下的高度
  final double? indicatorBottomMarginLeft; //指示器在Banner下的 距离左边
  final double? indicatorBottomMarginRight; //指示器在Banner下的 距离右边
  final MainAxisAlignment indicatorBottomMainAxisAlignment; //指示器在Banner下的位置
  final int? delay; //多少时间轮播一次
  final bool? autoPlay; //是否自动轮播
  final bool? showIndicators; //是否展示指示器
  final Function(int)? bannerClick; //点击事件
  final double? viewportFraction; //banner缩进
  final Alignment? textIndicatorAlignment; //文字的位置
  final TextStyle? textIndicatorStyle; //文字样式
  final Color? textIndicatorBgColor; //文字指示器背景
  final double? textIndicatorPadding; //文字指示器内边距
  final double? textIndicatorPaddingLeft; //文字指示器内边距左
  final double? textIndicatorPaddingTop; //文字指示器内边距上
  final double? textIndicatorPaddingRight; //文字指示器内边距右
  final double? textIndicatorPaddingBottom; //文字指示器内边距下
  final Color? titleBgColor; //文字Title背景
  final double? titleHeight; //文字Title高度
  final Alignment? titleAlignment; //文字Title的位置
  final TextStyle? titleStyle; //文字Title样式
  final double? titleMarginBottom; //文字Title距离底部
  final double? bannerOtherScale; //除中间外的其他图片缩放比例
  final String? placeholderImage; //Banner 占位图
  final String? errorImage; //错误图
  final BoxFit? imageBoxFit; //图片伸缩模式

  const VipBanner(
      {super.key,
      required this.imageList,
      this.radius = 0,
      this.height = 150, //默认高度150
      this.marginLeft = 0,
      this.marginTop = 0,
      this.marginRight = 0,
      this.marginBottom = 0,
      this.margin,
      this.imageMarginLeft = 0,
      this.imageMarginTop = 0,
      this.imageMarginRight = 0,
      this.imageMarginBottom = 0,
      this.imageMargin,
      this.indicatorMarginBottom = 10, //默认指示器距离底部10
      this.indicatorMarginRight, //指示器距离右边
      this.indicatorMarginLeft, //指示器距离右边
      this.indicatorSelectColor = Colors.red,
      this.indicatorUnSelectColor = Colors.grey,
      this.indicatorWidth = 10, //指示器宽
      this.indicatorHeight = 10, //指示器高
      this.indicatorMargin = 5, //指示器边距
      this.indicatorType = IndicatorType.circle,
      this.indicatorRadius = 0, //指示器圆角度数
      this.indicatorUnWidth,
      this.indicatorUnHeight,
      this.indicatorBannerBottom = false,
      this.indicatorBottomColor = Colors.transparent,
      this.indicatorBottomHeight = 30,
      this.indicatorBottomMarginLeft = 0,
      this.indicatorBottomMarginRight = 0,
      this.indicatorBottomMainAxisAlignment = MainAxisAlignment.center,
      this.delay = 5, //默认是5秒轮询一次
      this.autoPlay = true, //默认是自动轮播
      this.showIndicators = true, //默认展示指示器
      this.bannerClick,
      this.viewportFraction = 1, //banner缩进
      this.textIndicatorAlignment = Alignment.center,
      this.textIndicatorStyle,
      this.textIndicatorPadding,
      this.textIndicatorPaddingLeft = 0,
      this.textIndicatorPaddingTop = 0,
      this.textIndicatorPaddingRight = 0,
      this.textIndicatorPaddingBottom = 0,
      this.textIndicatorBgColor = Colors.transparent,
      this.titleList,
      this.titleBgColor = Colors.transparent,
      this.titleHeight,
      this.titleAlignment = Alignment.centerLeft,
      this.titleStyle,
      this.titleMarginBottom = 0,
      this.bannerOtherScale = 1.0,
      this.placeholderImage,
      this.imageBoxFit = BoxFit.cover,
      this.errorImage});

  @override
  State<StatefulWidget> createState() => _CarouselState();
}

class _CarouselState extends State<VipBanner> with WidgetsBindingObserver {
  late PageController _controller;
  int _currentPage = 0;
  int _pagePosition = 0;

  // 定时器实例
  Timer? _timer;

  //计时器的运行状态
  bool _isRunning = false;

  //是否触发了点击
  bool _isClick = true;

  /*
  * 开启定时
  * */
  void _startTimer() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(Duration(seconds: widget.delay!), (timer) {
        _controller.animateToPage(_pagePosition + 1,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut);
      });
    }
  }

  /*
  * 暂停定时
  * */
  void _pauseTimer() {
    if (_isRunning) {
      _isRunning = false;
      _timer?.cancel(); //取消计时器
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: widget.viewportFraction!);
    // 添加监听
    WidgetsBinding.instance.addObserver(this);
    if (widget.autoPlay!) {
      _startTimer();
    }
  }

  /*
  * 感知生命周期变化
  * */
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _startTimer(); //页面可见，开启定时
    } else if (state == AppLifecycleState.paused) {
      _pauseTimer(); //页面不可见，关闭定时
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  /*
  * 页面滑动监听
  * */
  void _onPageChanged(int index) {
    var position = index % widget.imageList!.length;
    setState(() {
      _currentPage = position;
      _pagePosition = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bannerImage = Container(
      margin: widget.margin != null
          ? EdgeInsets.all(widget.margin!)
          : EdgeInsets.only(
              left: widget.marginLeft!,
              top: widget.marginTop!,
              right: widget.marginRight!,
              bottom: widget.marginBottom!),
      height: widget.height,
      child: Listener(
          onPointerDown: (event) {
            //手指按下，定时取消
            _pauseTimer();
            _isClick = true;
          },
          onPointerMove: (event) {
            _isClick = false;
          },
          onPointerUp: (event) {
            //手指抬起，定时开启
            _startTimer();
            //作为点击事件
            if (_isClick && widget.bannerClick != null) {
              widget.bannerClick!(_currentPage);
            }
          },
          child: PageView.builder(
              controller: _controller,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                double endScale = 1.0;
                var position = index % widget.imageList!.length;
                if (position == _currentPage) {
                  endScale = 1.0;
                } else {
                  endScale = widget.bannerOtherScale!;
                }
                String imageUrl = widget.imageList![position];
                return Transform.scale(
                    scale: endScale,
                    child: Container(
                        margin: widget.imageMargin != null
                            ? EdgeInsets.all(widget.imageMargin!)
                            : EdgeInsets.only(
                                left: widget.imageMarginLeft!,
                                top: widget.imageMarginTop!,
                                right: widget.imageMarginRight!,
                                bottom: widget.imageMarginBottom!),
                        child: ClipRRect(
                            //设置图片圆角
                            borderRadius: BorderRadius.circular(widget.radius!),
                            child: getBannerImage(imageUrl))));
              })),
    );
    return !widget.indicatorBannerBottom!
        ? Stack(
            children: [
              bannerImage,
              if (widget.titleList != null) bannerTitle(),
              if (widget.showIndicators!) getBannerIndicators()
            ],
          )
        : Column(children: [
            bannerImage,
            if (widget.showIndicators!) getBannerBottomIndicators()
          ]);
  }

  /*
  * 获取轮播图
  * */
  Widget getBannerImage(imageUrl) {
    //不需要占位图
    if (widget.placeholderImage == null) {
      return Image.network(
        imageUrl,
        fit: widget.imageBoxFit,
      );
    } else {
      return FadeInImage(
          fit: widget.imageBoxFit,
          placeholderFit: widget.imageBoxFit,
          placeholder: getPlaceholder(),
          image: NetworkImage(imageUrl),
          placeholderErrorBuilder: (ctx, err, stackTrace) =>
              _imagePlaceholder(),
          imageErrorBuilder: (ctx, err, stackTrace) => _imageError());
    }
  }

  /*
  * 占位图错误组件
  * */
  Widget _imagePlaceholder() {
    return Image.asset(ImageConstant.imageDefault, fit: widget.imageBoxFit);
  }

  /*
  * 错误组件
  * */
  Widget _imageError() {
    var imagePath = ImageConstant.imageDefault;
    if (widget.errorImage != null) {
      imagePath = widget.errorImage!;
    }
    return Image.asset(imagePath, fit: widget.imageBoxFit);
  }

  /*
  * 占位图
  * */
  ImageProvider getPlaceholder() {
    return AssetImage(widget.placeholderImage!);
  }

  /*
  * 获取指示器
  * */
  Widget getBannerIndicators() {
    return Positioned(
      left: widget.indicatorMarginRight != null
          ? null
          : widget.indicatorMarginLeft ?? 0,
      right: widget.indicatorMarginLeft != null
          ? null
          : widget.indicatorMarginRight ?? 0,
      bottom: widget.indicatorMarginBottom!,
      child: _buildIndicators(MainAxisAlignment.center),
    );
  }

  /*
  * 获取指示器,底部
  * */
  Widget getBannerBottomIndicators() {
    return Container(
      height: widget.indicatorBottomHeight,
      color: widget.indicatorBottomColor,
      margin: EdgeInsets.only(
          left: widget.indicatorBottomMarginLeft!,
          right: widget.indicatorBottomMarginRight!),
      child: _buildIndicators(widget.indicatorBottomMainAxisAlignment),
    );
  }

  /*
  * 指示器
  * */
  Widget _buildIndicators(mainAxisAlignment) {
    if (widget.indicatorType == IndicatorType.text) {
      //文字
      return Container(
        alignment: widget.textIndicatorAlignment,
        child: VipText(
          "${_currentPage + 1}/${widget.imageList!.length}",
          style: widget.textIndicatorStyle,
          backgroundColor: widget.textIndicatorBgColor,
          padding: widget.textIndicatorPadding,
          paddingLeft: widget.textIndicatorPaddingLeft,
          paddingTop: widget.textIndicatorPaddingTop,
          paddingRight: widget.textIndicatorPaddingRight,
          paddingBottom: widget.textIndicatorPaddingBottom,
        ),
      );
    }
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: List.generate(widget.imageList!.length, (index) {
        return Container(
          width: _currentPage == index
              ? widget.indicatorWidth
              : widget.indicatorUnWidth ?? widget.indicatorWidth,
          height: _currentPage == index
              ? widget.indicatorHeight
              : widget.indicatorUnHeight ?? widget.indicatorHeight,
          margin: EdgeInsets.symmetric(horizontal: widget.indicatorMargin!),
          decoration: BoxDecoration(
            shape: widget.indicatorType == IndicatorType.circle
                ? BoxShape.circle
                : BoxShape.rectangle,
            borderRadius: widget.indicatorType == IndicatorType.rectangle
                ? BorderRadius.all(Radius.circular(widget.indicatorRadius!))
                : null,
            color: _currentPage == index
                ? widget.indicatorSelectColor
                : widget.indicatorUnSelectColor,
          ),
        );
      }),
    );
  }

  /*
  * 返回Banner标题描述
  * */
  Widget bannerTitle() {
    return Positioned(
      bottom: widget.titleMarginBottom,
      left: 0,
      right: 0,
      child: VipText(
        widget.titleList![_currentPage],
        height: widget.titleHeight ?? widget.titleHeight,
        backgroundColor: widget.titleBgColor,
        alignment: widget.titleAlignment,
        style: widget.titleStyle,
      ),
    );
  }
}

///指示器类型
enum IndicatorType { circle, rectangle, text }
