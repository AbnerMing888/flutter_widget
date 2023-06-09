import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../base/base_page_state.dart';
import '../../../../constants/image_constant.dart';
import '../../../../utils/toast.dart';
import '../../../widget/vip_app_bar_view.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/17
///INTRODUCE:AppBar组件效果页面

class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<StatefulWidget> createState() => _AppBarPageState();
}

class _AppBarPageState extends BasePageState {
  @override
  Widget getBody(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 10),
          child: VipAppBarView(
            "测试标题",
            onLeftClick: () {
              Toast.toast(context, msg: "左边点击");
            },
          )),
      Container(
          margin: const EdgeInsets.only(top: 10),
          child: VipAppBarView(
            "测试标题",
            barIsClose: true,
            onLeftClick: () {
              Toast.toast(context, msg: "左边点击");
            },
            onLeftCloseClick: () {
              Toast.toast(context, msg: "左边关闭点击");
            },
          )),
      Container(
          margin: const EdgeInsets.only(top: 10),
          child: VipAppBarView(
            "测试标题",
            barRightMenuText: "右边",
            onLeftClick: () {
              Toast.toast(context, msg: "左边点击");
            },
            onRightMenuTextClick: () {
              Toast.toast(context, msg: "文字右边");
            },
          )),
      Container(
          margin: const EdgeInsets.only(top: 10),
          child: VipAppBarView(
            "测试标题",
            barRightMenuImage: ImageConstant.buttonLeftSendInvite,
            onLeftClick: () {
              Toast.toast(context, msg: "左边点击");
            },
            onRightMenuImageClick: () {
              Toast.toast(context, msg: "图片右边");
            },
          )),
      Container(
          margin: const EdgeInsets.only(top: 10),
          child: VipAppBarView(
            "测试标题",
            barRightMenuText: "右边",
            barRightMenuImage: ImageConstant.buttonLeftSendInvite,
            onLeftClick: () {
              Toast.toast(context, msg: "左边点击");
            },
            onRightMenuTextClick: () {
              Toast.toast(context, msg: "文字右边");
            },
            onRightMenuImageClick: () {
              Toast.toast(context, msg: "图片右边");
            },
          )),
    ]);
  }

  @override
  String getTitle() {
    return "AppBar";
  }
}
