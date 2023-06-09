import 'package:flutter/material.dart';

import '../../../../base/base_page_state.dart';
import '../../../../constants/dimen_constant.dart';
import '../../../../constants/image_constant.dart';
import '../../../widget/vip_image.dart';
import '../../../widget/vip_text.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/16
///INTRODUCE:Image组件效果页面
class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<StatefulWidget> createState() => _ImagePageState();
}

class _ImagePageState extends BasePageState {
  @override
  Widget getBody(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
          left: DimenConstant.dimen_10, right: DimenConstant.dimen_10),
      child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
            VipImage(
              "https://www.vipandroid.cn/ming/image/gan.png",
              marginTop: DimenConstant.dimen_10,
            ),
            VipText("(普通加载)", marginTop: DimenConstant.dimen_5),
            VipImage(
              "https://www.vipandroid.cn/ming/image/gan.png",
              marginTop: DimenConstant.dimen_10,
              width: 80,
              height: 80,
            ),
            VipText("(设置宽高)", marginTop: DimenConstant.dimen_5),
            VipImage(
              "https://www.vipandroid.cn/ming/image/gan.png",
              marginTop: DimenConstant.dimen_10,
              imageBoxFit: BoxFit.fill,
              width: 80,
              height: 80,
            ),
            VipText("(设置宽高拉伸充满)", marginTop: DimenConstant.dimen_5),
            VipImage(
              "https://www.vipandroid.cn/ming/image/gan.png",
              marginTop: DimenConstant.dimen_10,
              imageBoxFit: BoxFit.cover,
              width: 80,
              height: 80,
            ),
            VipText("(设置宽高居中裁切)", marginTop: DimenConstant.dimen_5),
            VipImage(
              "https://www.vipandroid.cn/ming/image/gan.png",
              marginTop: DimenConstant.dimen_10,
              imageBoxFit: BoxFit.cover,
              placeholderImage: ImageConstant.imageDefault,
              width: 80,
              height: 80,
            ),
            VipText("(设置占位图)", marginTop: DimenConstant.dimen_5),
            VipImage(
              "https://www.vipandroid.cn/ming/image/gan.png",
              marginTop: DimenConstant.dimen_10,
              imageBoxFit: BoxFit.cover,
              isClipOval: true,
              width: 80,
              height: 80,
            ),
            VipText("(设置圆形)", marginTop: DimenConstant.dimen_5),
            VipImage(
              "https://www.vipandroid.cn/ming/image/gan.png",
              marginTop: DimenConstant.dimen_10,
              imageBoxFit: BoxFit.cover,
              imageRadius: DimenConstant.dimen_10,
              placeholderImage: ImageConstant.imageDefault,
              width: 80,
              height: 80,
            ),
            VipText("(设置圆角)", marginTop: DimenConstant.dimen_5),
          ])),
    );
  }

  @override
  String getTitle() {
    return "Image";
  }
}
