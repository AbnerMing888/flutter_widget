import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/base/base_page_state.dart';
import 'package:flutter_widget/ui/widget/vip_video_controller.dart';

///AUTHOR:AbnerMing
///DATE:2023/6/26
///INTRODUCE:Video页面

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<StatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends BasePageState<VideoPage> {
  @override
  Widget getBody(BuildContext context) {
    return Center(
      child: VipVideoController(
        totalTime: 1000 * 60,
        backgroundColor: Colors.red,
        progressColor: Colors.amber,
        thumbColor: Colors.red,
        textStyle: const TextStyle(color: Colors.red),
        onVideoPlayClick: (isPlay) {
          print("当前播放按钮状态$isPlay");
        },
        onVideoFullScreenClick: (isFullScreen) {
          print("当前全屏按钮状态$isFullScreen");
        },
        onVideoChanged: (position) {
          //返回毫秒
          print("当前拖拽的进度$position");
        }
      ),
    );
  }

  @override
  String getTitle() {
    return "Video控制器";
  }
}
