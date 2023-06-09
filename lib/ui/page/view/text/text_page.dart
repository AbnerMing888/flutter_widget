import 'package:flutter/material.dart';

import '../../../../base/base_page_state.dart';
import '../../../../constants/color_constant.dart';
import '../../../../constants/dimen_constant.dart';
import '../../../../constants/image_constant.dart';
import '../../../../data/bean/text_rich_bean.dart';
import '../../../../utils/hex_color.dart';
import '../../../../utils/toast.dart';
import '../../../widget/vip_text.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/12
///INTRODUCE:Text组件效果页面

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<StatefulWidget> createState() => _TextPageState();
}

class _TextPageState extends BasePageState {
  @override
  Widget getBody(BuildContext context) {
    return Column(
      children: [
        VipText("普通文字", marginTop: DimenConstant.dimen_10, onClick: () {
          Toast.toast(context, msg: "普通文字");
        }),
        VipText("加粗文字",
            marginTop: DimenConstant.dimen_10,
            style: const TextStyle(fontWeight: FontWeight.bold), onClick: () {
          Toast.toast(context, msg: "加粗文字");
        }),
        VipText("倾斜文字",
            marginTop: DimenConstant.dimen_10,
            style: const TextStyle(fontStyle: FontStyle.italic), onClick: () {
          Toast.toast(context, msg: "倾斜文字");
        }),
        VipText("文字背景颜色",
            marginTop: DimenConstant.dimen_10,
            backgroundColor: HexColor(ColorConstant.color_74d1d7), onClick: () {
          Toast.toast(context, msg: "文字背景颜色");
        }),
        VipText("文字圆角背景",
            marginTop: DimenConstant.dimen_10,
            radius: 10,
            solidColor: HexColor(ColorConstant.color_74d1d7),
            padding: 3, onClick: () {
          Toast.toast(context, msg: "文字圆角背景");
        }),
        VipText("文字圆角框背景",
            marginTop: DimenConstant.dimen_10,
            radius: 10,
            strokeColor: Colors.red,
            padding: 3, onClick: () {
          Toast.toast(context, msg: "文字圆角框背景");
        }),
        VipText("圆",
            marginTop: DimenConstant.dimen_10,
            isCircle: true,
            solidColor: Colors.cyan,
            padding: 8, onClick: () {
          Toast.toast(context, msg: "圆");
        }),
        VipText("下划线文字",
            marginTop: DimenConstant.dimen_10,
            style: const TextStyle(decoration: TextDecoration.underline),
            onClick: () {
          Toast.toast(context, msg: "下划线文字");
        }),
        VipText("下划波浪线文字",
            marginTop: DimenConstant.dimen_10,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.wavy,
            ), onClick: () {
          Toast.toast(context, msg: "下划波浪线文字");
        }),
        VipText("删除线文字",
            marginTop: DimenConstant.dimen_10,
            style: const TextStyle(decoration: TextDecoration.lineThrough),
            onClick: () {
          Toast.toast(context, msg: "删除线文字");
        }),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Colors.red, Colors.blue],
            ).createShader(Offset.zero & bounds.size);
          },
          child: VipText(
            '文字设置渐变色',
            marginTop: DimenConstant.dimen_10,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            onClick: () {
              Toast.toast(context, msg: "文字设置渐变色");
            },
          ),
        ),
        VipText("改变颜色",
            style: TextStyle(color: HexColor(ColorConstant.color_74d1d7)),
            marginTop: DimenConstant.dimen_10, onClick: () {
          Toast.toast(context, msg: "改变颜色");
        }),
        VipText("左边带有Icon文字",
            marginTop: DimenConstant.dimen_10,
            leftIcon: ImageConstant.buttonLeftDownLoad,
            iconMarginRight: 10, onClick: () {
          Toast.toast(context, msg: "左边带有Icon文字");
        }),
        VipText("右边带有Icon文字",
            marginTop: DimenConstant.dimen_10,
            rightIcon: ImageConstant.buttonLeftDownLoad,
            iconMarginLeft: 10, onClick: () {
          Toast.toast(context, msg: "右边带有Icon文字");
        }),
        VipText("上边带有Icon文字",
            marginTop: DimenConstant.dimen_10,
            strokeColor: HexColor(ColorConstant.color_74d1d7),
            topIcon: ImageConstant.buttonLeftDownLoad, onClick: () {
          Toast.toast(context, msg: "上边带有Icon文字");
        }),
        VipText("下边带有Icon文字",
            strokeColor: HexColor(ColorConstant.color_74d1d7),
            marginTop: DimenConstant.dimen_10,
            bottomIcon: ImageConstant.buttonLeftDownLoad, onClick: () {
          Toast.toast(context, msg: "下边带有Icon文字");
        }),
        VipText(
          "超出的文字展示省略号，不妨我们就简单测试一下，看看是否能实现，再多打些文字看看吧，马上就够了，不着急哈，再输入一点",
          textOverflow: TextOverflow.ellipsis,
          marginLeft: DimenConstant.dimen_10,
          marginRight: DimenConstant.dimen_10,
          maxLines: 2,
          marginTop: DimenConstant.dimen_10,
          onClick: () {
            Toast.toast(context, msg: "超出文字点击");
          },
        ),
        VipText("富文本设置", richList: [
          TextRichBean(text: "我已经阅读并同意"),
          TextRichBean(
              text: "《用户服务协议》",
              textColor: HexColor(ColorConstant.color_74d1d7)),
          TextRichBean(text: "和"),
          TextRichBean(
              text: "《用户隐私政策》", textColor: HexColor(ColorConstant.color_74d1d7))
        ], onRichClick: (position, richBean) {
          //富文本点击事件
          Toast.toast(context, msg: "${richBean.text}");
        }, marginTop: DimenConstant.dimen_10)
      ],
    );
  }

  @override
  String getTitle() {
    return "Text";
  }
}
