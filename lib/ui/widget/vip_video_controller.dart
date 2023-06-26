import 'dart:async';
import 'package:flutter/material.dart';
import '../../utils/time_util.dart';
import 'vip_image.dart';
import 'vip_text.dart';

///AUTHOR:AbnerMing
///DATE:2023/6/26
///INTRODUCE:Video控制器

class VipVideoController extends StatefulWidget {
  final double? height; //高度
  final double? progressHeight; //进度条高度
  final String? videoPlayIcon; //视频播放Icon
  final String? videoPauseIcon; //视频暂停Icon
  final String? videoFullScreenIcon; //视频全屏Icon
  final String? videoExitFullScreenIcon; //退出全屏Icon
  final TextStyle? textStyle; //文本样式
  final Color? backgroundColor; //背景颜色
  final Color? progressColor; //进度颜色
  final Color? thumbColor; //thumbColor
  final double thumbRadius; //thumb大小
  final double? playTimeMarginLeft; //播放时间距离左边的距离
  final double? playTimeMarginRight; //播放时间距离左边的距离
  final double? videoTimeMarginLeft; //视频时间距离左边的距离
  final double? videoTimeMarginRight; //视频时间距离左边的距离
  final int? totalTime; //总时长
  final int? changeTime; //改变时长
  final bool? isTimer; //是否需要定时
  final ValueChanged<bool>? onVideoPlayClick; //视频播放点击
  final ValueChanged<bool>? onVideoFullScreenClick; //视频全屏点击点击
  // 滑动回调
  final ValueChanged<int>? onVideoChanged;

  final ValueChanged<int>? onVideoChangeStart; //拖动开始
  final ValueChanged<int>? onVideoChangeEnd; //拖动结束

  final bool? isPlayed; //播放控制状态，暂停还是开始
  final bool? isFullScreen; //是否是全屏

  const VipVideoController({
    super.key,
    this.height = 30, //默认高度
    this.progressHeight = 5, //进度条高度
    this.videoPlayIcon,
    this.videoPauseIcon,
    this.videoFullScreenIcon,
    this.videoExitFullScreenIcon,
    this.textStyle,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.black,
    this.thumbColor = Colors.black,
    this.thumbRadius = 8,
    this.playTimeMarginLeft = 5,
    this.playTimeMarginRight = 0,
    this.videoTimeMarginLeft = 0,
    this.videoTimeMarginRight = 5,
    this.totalTime = 0,
    this.changeTime = 0,
    this.isTimer = false, //默认不开启定时
    this.onVideoPlayClick,
    this.onVideoFullScreenClick,
    this.onVideoChanged,
    this.onVideoChangeStart,
    this.onVideoChangeEnd,
    this.isPlayed = true,
    this.isFullScreen = false,
  });

  @override
  State<StatefulWidget> createState() => _VipVideoControllerState();
}

class _VipVideoControllerState extends State<VipVideoController> {
  var _progress = 0;
  bool _isPlayed = true; //播放控制状态，暂停还是开始
  bool _isFullScreen = false; //是否是全屏
  VoidCallback? onPlayClick; //播放点击事件
  VoidCallback? onFullScreenClick; //全屏点击事件

  // 定时器实例
  Timer? _timer;

  @override
  void initState() {
    _progress = widget.changeTime!;
    _isPlayed = widget.isPlayed!;
    _isFullScreen = widget.isFullScreen!;
    onPlayClick = () {
      //监听点击事件
      setState(() {
        _isPlayed = !_isPlayed;
        if (widget.onVideoPlayClick != null) {
          widget.onVideoPlayClick!(_isPlayed); //设置播放状态
        }
        if (_isPlayed) {
          _startTimer();
        } else {
          _pauseTimer();
        }
      });
    };
    onFullScreenClick = () {
      setState(() {
        _isFullScreen = !_isFullScreen;
        //设置全屏状态
        if (widget.onVideoFullScreenClick != null) {
          widget.onVideoFullScreenClick!(_isFullScreen);
        }
      });
    };

    _startTimer();

    super.initState();
  }

  /*
  * 开启定时
  * */
  void _startTimer() {
    if (widget.isTimer! && _timer == null) {
      //开启定时，一秒执行一次
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_progress >= widget.totalTime!) {
          _pauseTimer();
        } else {
          setState(() {
            _progress += 1000;
          });
          widget.onVideoChanged!(_progress);
        }
      });
    }
  }

  /*
  * 暂停定时
  * */
  void _pauseTimer() {
    if (_timer != null) {
      _timer!.cancel(); //取消计时器
      _timer = null;
    }
  }

  @override
  void dispose() {
    _pauseTimer();
    super.dispose();
  }

  /*
   *获取播放时长
   * */
  Widget getPlayTime(String text) {
    return VipText(
      text,
      style: widget.textStyle,
      marginLeft: widget.playTimeMarginLeft,
      marginRight: widget.playTimeMarginRight,
    );
  }

  /*
   *获取总的播放时长
   * */
  Widget getVideoTime(String text) {
    return VipText(
      text,
      style: widget.textStyle,
      marginLeft: widget.videoTimeMarginLeft,
      marginRight: widget.videoTimeMarginRight,
    );
  }

  /*
  * 获取播放Icon
  * */
  Widget getPlayIcon() {
    if (widget.videoPlayIcon == null) {
      return InkWell(
        onTap: onPlayClick,
        child: Icon(_isPlayed ? Icons.pause : Icons.play_arrow),
      );
    } else {
      return VipImage(
        _isPlayed ? widget.videoPlayIcon : widget.videoPauseIcon,
        onClick: onPlayClick,
      );
    }
  }

  /*
  * 获取全屏Icon
  * */
  Widget getFullScreenIcon() {
    if (widget.videoFullScreenIcon == null) {
      return InkWell(
        onTap: onFullScreenClick,
        child: Icon(_isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen),
      );
    } else {
      return VipImage(
        _isFullScreen
            ? widget.videoFullScreenIcon
            : widget.videoExitFullScreenIcon,
        onClick: onFullScreenClick,
      );
    }
  }

  /*
  * 时间戳转换时间
  * */
  String timeStampToStringDate(int time) {
    String format = time < 1000 * 60 * 60 ? TimeUtil.m_s : TimeUtil.h_m_s;
    return TimeUtil.getTimeStampToStringDate(time, format: format);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        child: Row(
          children: [
            getPlayIcon(), //开始和暂停
            getPlayTime(timeStampToStringDate(_progress)), //时间
            Expanded(child: getSliderTheme()), //进度
            getVideoTime(timeStampToStringDate(widget.totalTime!)), //时间
            getFullScreenIcon() //全屏
          ],
        ));
  }

  Widget getSliderTheme() {
    var divisions = widget.totalTime! / 1000;
    return SliderTheme(
      data: SliderThemeData(
          //高度
          trackHeight: widget.progressHeight,
          //去掉长按光晕
          overlayColor: Colors.transparent,
          //背景颜色
          inactiveTrackColor: widget.backgroundColor,
          activeTrackColor: widget.progressColor,
          thumbColor: widget.thumbColor,
          thumbShape:
              RoundSliderThumbShape(enabledThumbRadius: widget.thumbRadius)),
      child: Slider(
        min: 0,
        max: widget.totalTime!.toDouble(),
        value: _progress.toDouble(),
        divisions: divisions.toInt(),
        onChangeStart: (progress) {
          if (widget.onVideoChangeStart != null) {
            widget.onVideoChangeStart!(progress.toInt());
          }
        },
        onChangeEnd: (progress) {
          if (widget.onVideoChangeEnd != null) {
            widget.onVideoChangeEnd!(progress.toInt());
          }
          if (_isPlayed) {
            //播放状态下，如果定时，才会执行
            _startTimer();
          }
        },
        onChanged: (double value) {
          setState(() {
            _progress = value.toInt();
          });
          //回调当前进度
          if (widget.onVideoChanged != null) {
            widget.onVideoChanged!(_progress);
          }
        },
      ),
    );
  }
}
