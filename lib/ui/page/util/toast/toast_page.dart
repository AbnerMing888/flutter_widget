import 'package:flutter/material.dart';

import '../../../../base/base_page_state.dart';
import '../../../../constants/color_constant.dart';
import '../../../../constants/dimen_constant.dart';
import '../../../../constants/image_constant.dart';
import '../../../../constants/toast_type.dart';
import '../../../../utils/hex_color.dart';
import '../../../../utils/toast.dart';
import '../../../widget/vip_button.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/20
///INTRODUCE:Toast页面

class ToastPage extends StatefulWidget {
  const ToastPage({super.key});

  @override
  State<StatefulWidget> createState() => _ToastPageState();
}

class _ToastPageState extends BasePageState<ToastPage> {
  @override
  Widget getBody(BuildContext context) {
    return Column(children: [
      VipButton("Toast(普通)",
          marginTop: DimenConstant.dimen_10,
          height: 40,
          marginLeft: DimenConstant.dimen_22,
          marginRight: DimenConstant.dimen_22,
          style: const TextStyle(color: Colors.white),
          solidColor: HexColor(ColorConstant.color_74d1d7),
          radius: DimenConstant.dimen_10, onClick: () {
        Toast.toast(context, msg: "普通");
      }),
      VipButton("Toast(长文本)",
          marginTop: DimenConstant.dimen_10,
          height: 40,
          marginLeft: DimenConstant.dimen_22,
          marginRight: DimenConstant.dimen_22,
          style: const TextStyle(color: Colors.white),
          solidColor: HexColor(ColorConstant.color_74d1d7),
          radius: DimenConstant.dimen_10, onClick: () {
        Toast.toast(context, msg: "提示文案最好请控制在十六个字以内超出换行");
      }),
      VipButton("Toast(更改背景)",
          marginTop: DimenConstant.dimen_10,
          height: 40,
          marginLeft: DimenConstant.dimen_22,
          marginRight: DimenConstant.dimen_22,
          style: const TextStyle(color: Colors.white),
          solidColor: HexColor(ColorConstant.color_74d1d7),
          radius: DimenConstant.dimen_10, onClick: () {
        Toast.toast(context, msg: "更改背景", bgColor: Colors.cyan);
      }),
      VipButton("Toast(更改位置)",
          marginTop: DimenConstant.dimen_10,
          height: 40,
          marginLeft: DimenConstant.dimen_22,
          marginRight: DimenConstant.dimen_22,
          style: const TextStyle(color: Colors.white),
          solidColor: HexColor(ColorConstant.color_74d1d7),
          radius: DimenConstant.dimen_10, onClick: () {
        Toast.toast(context,
            msg: "Toast(更改位置)", position: ToastPosition.center);
      }),
      VipButton("Toast(更改时长)",
          marginTop: DimenConstant.dimen_10,
          height: 40,
          marginLeft: DimenConstant.dimen_22,
          marginRight: DimenConstant.dimen_22,
          style: const TextStyle(color: Colors.white),
          solidColor: HexColor(ColorConstant.color_74d1d7),
          radius: DimenConstant.dimen_10, onClick: () {
        Toast.toast(context, msg: "更改时长", showTime: 5000);
      }),
      VipButton("普通成功提示",
          marginTop: DimenConstant.dimen_10,
          height: 40,
          marginLeft: DimenConstant.dimen_22,
          marginRight: DimenConstant.dimen_22,
          style: const TextStyle(color: Colors.white),
          solidColor: HexColor(ColorConstant.color_74d1d7),
          radius: DimenConstant.dimen_10, onClick: () {
        Toast.toast(context, msg: "普通成功提示", toastPrompt: ToastPrompt.success);
      }),
      VipButton("设置宽高成功提示",
          marginTop: DimenConstant.dimen_10,
          height: 40,
          marginLeft: DimenConstant.dimen_22,
          marginRight: DimenConstant.dimen_22,
          style: const TextStyle(color: Colors.white),
          solidColor: HexColor(ColorConstant.color_74d1d7),
          radius: DimenConstant.dimen_10, onClick: () {
        Toast.toast(context,
            msg: "设置宽高成功提示",
            pdHorizontal: 10,
            toastWidth: 100,
            toastHeight: 100,
            toastPrompt: ToastPrompt.success);
      }),
      VipButton("错误提示",
          marginTop: DimenConstant.dimen_10,
          height: 40,
          marginLeft: DimenConstant.dimen_22,
          marginRight: DimenConstant.dimen_22,
          style: const TextStyle(color: Colors.white),
          solidColor: HexColor(ColorConstant.color_74d1d7),
          radius: DimenConstant.dimen_10, onClick: () {
        Toast.toast(context, msg: "错误提示", toastPrompt: ToastPrompt.error);
      }),
      VipButton("警示提示",
          marginTop: DimenConstant.dimen_10,
          height: 40,
          marginLeft: DimenConstant.dimen_22,
          marginRight: DimenConstant.dimen_22,
          style: const TextStyle(color: Colors.white),
          solidColor: HexColor(ColorConstant.color_74d1d7),
          radius: DimenConstant.dimen_10, onClick: () {
        Toast.toast(context, msg: "警示提示", toastPrompt: ToastPrompt.warn);
      }),
      VipButton("正在加载",
          marginTop: DimenConstant.dimen_10,
          height: 40,
          marginLeft: DimenConstant.dimen_22,
          marginRight: DimenConstant.dimen_22,
          style: const TextStyle(color: Colors.white),
          solidColor: HexColor(ColorConstant.color_74d1d7),
          radius: DimenConstant.dimen_10, onClick: () {
        Toast.toast(context, msg: "正在加载", toastPrompt: ToastPrompt.loading);
      }),
      VipButton("单独设置Icon(本地)",
          marginTop: DimenConstant.dimen_10,
          height: 40,
          marginLeft: DimenConstant.dimen_22,
          marginRight: DimenConstant.dimen_22,
          style: const TextStyle(color: Colors.white),
          solidColor: HexColor(ColorConstant.color_74d1d7),
          radius: DimenConstant.dimen_10, onClick: () {
        Toast.toast(context,
            msg: "单独设置Icon", iconPath: ImageConstant.buttonLeftDownLoad);
      }),
      VipButton("单独设置Icon(网络)",
          marginTop: DimenConstant.dimen_10,
          height: 40,
          marginLeft: DimenConstant.dimen_22,
          marginRight: DimenConstant.dimen_22,
          style: const TextStyle(color: Colors.white),
          solidColor: HexColor(ColorConstant.color_74d1d7),
          radius: DimenConstant.dimen_10, onClick: () {
        Toast.toast(context,
            msg: "单独设置Icon",
            iconPath: "https://www.vipandroid.cn/ming/image/gan.png");
      }),
    ]);
  }

  @override
  String getTitle() {
    return "Toast";
  }
}
