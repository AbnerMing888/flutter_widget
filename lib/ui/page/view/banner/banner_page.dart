import 'package:flutter/cupertino.dart';

import '../../../../base/base_page_state.dart';
import '../../../../utils/toast.dart';
import '../../../widget/vip_banner.dart';
import '../../../widget/vip_text.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/22
///INTRODUCE:Banner页面

class BannerPage extends StatefulWidget {
  const BannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _BannerPageState();
}

class _BannerPageState extends BasePageState<BannerPage> {
  @override
  Widget getBody(BuildContext context) {
    // titleList: const ["Android干货铺全新改版！", "每日新闻，快速知道当天的时事！"],
    return SingleChildScrollView(
        child: Column(children: [
      VipBanner(
          imageList: const [
            "https://www.vipandroid.cn/ming/image/gan.png",
            "https://www.vipandroid.cn/ming/image/zao.png"
          ],
          bannerClick: (position) {
            //条目点击
            Toast.toast(context, msg: position.toString());
          }),
      const VipText("普通的轮播图"),
      VipBanner(
          imageList: const [
            "https://www.vipandroid.cn/ming/image/gan.png",
            "https://www.vipandroid.cn/ming/image/zao.png"
          ],
          indicatorType: IndicatorType.text,
          bannerClick: (position) {
            Toast.toast(context, msg: position.toString());
          }),
      const VipText("文字指示器"),
      VipBanner(
          imageList: const [
            "https://www.vipandroid.cn/ming/image/gan.png",
            "https://www.vipandroid.cn/ming/image/zao.png"
          ],
          indicatorType: IndicatorType.rectangle,
          indicatorRadius: 5,
          indicatorWidth: 20,
          indicatorHeight: 5,
          bannerClick: (position) {
            Toast.toast(context, msg: position.toString());
          }),
      const VipText("圆角指示器"),
      VipBanner(
          imageList: const [
            "https://www.vipandroid.cn/ming/image/gan.png",
            "https://www.vipandroid.cn/ming/image/zao.png"
          ],
          indicatorType: IndicatorType.rectangle,
          indicatorRadius: 5,
          indicatorWidth: 20,
          indicatorUnWidth: 10,
          indicatorHeight: 5,
          bannerClick: (position) {
            Toast.toast(context, msg: position.toString());
          }),
      const VipText("圆角指示器2"),
      VipBanner(
          imageList: const [
            "https://www.vipandroid.cn/ming/image/gan.png",
            "https://www.vipandroid.cn/ming/image/zao.png"
          ],
          indicatorType: IndicatorType.rectangle,
          bannerClick: (position) {
            Toast.toast(context, msg: position.toString());
          }),
      const VipText("矩形指示器"),
      VipBanner(
          imageList: const [
            "https://www.vipandroid.cn/ming/image/gan.png",
            "https://www.vipandroid.cn/ming/image/zao.png"
          ],
          indicatorType: IndicatorType.rectangle,
          indicatorWidth: 20,
          indicatorHeight: 5,
          bannerClick: (position) {
            Toast.toast(context, msg: position.toString());
          }),
      const VipText("矩形指示器2"),
      VipBanner(
          viewportFraction: 0.9,
          imageMarginLeft: 5,
          imageMarginRight: 5,
          imageList: const [
            "https://www.vipandroid.cn/ming/image/gan.png",
            "https://www.vipandroid.cn/ming/image/zao.png"
          ],
          bannerClick: (position) {
            Toast.toast(context, msg: position.toString());
          }),
      const VipText("伸缩"),
      VipBanner(
          viewportFraction: 0.8,
          bannerOtherScale: 0.9,
          radius: 10,
          imageList: const [
            "https://www.vipandroid.cn/ming/image/gan.png",
            "https://www.vipandroid.cn/ming/image/zao.png"
          ],
          bannerClick: (position) {
            Toast.toast(context, msg: position.toString());
          }),
      const VipText("伸缩2"),
      VipBanner(
          radius: 10,
          imageMarginLeft: 10,
          imageMarginRight: 10,
          imageList: const [
            "https://www.vipandroid.cn/ming/image/gan.png",
            "https://www.vipandroid.cn/ming/image/zao.png"
          ],
          bannerClick: (position) {
            Toast.toast(context, msg: position.toString());
          }),
      const VipText("圆角图片"),
      VipBanner(
          indicatorMarginLeft: 0,
          imageList: const [
            "https://www.vipandroid.cn/ming/image/gan.png",
            "https://www.vipandroid.cn/ming/image/zao.png"
          ],
          bannerClick: (position) {
            Toast.toast(context, msg: position.toString());
          }),
      const VipText("指示器左边"),
      VipBanner(
          indicatorMarginRight: 0,
          imageList: const [
            "https://www.vipandroid.cn/ming/image/gan.png",
            "https://www.vipandroid.cn/ming/image/zao.png"
          ],
          bannerClick: (position) {
            Toast.toast(context, msg: position.toString());
          }),
      const VipText("指示器右边"),
      VipBanner(
          indicatorBannerBottom: true,
          imageList: const [
            "https://www.vipandroid.cn/ming/image/gan.png",
            "https://www.vipandroid.cn/ming/image/zao.png"
          ],
          bannerClick: (position) {
            Toast.toast(context, msg: position.toString());
          }),
      const VipText("指示器图片下面")
    ]));
  }

  @override
  String getTitle() {
    return "Banner";
  }
}
