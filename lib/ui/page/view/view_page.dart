import 'package:flutter/material.dart';

import '../../../base/base_page_state.dart';
import '../../../data/bean/view_item_bean.dart';
import '../../../utils/router_manage.dart';
import '../../../utils/router_util.dart';
import '../../widget/vip_text.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/11
///INTRODUCE:各个组件页面

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends BasePageState<ViewPage> {
  final List<ViewItemBean> listData = [
    ViewItemBean("VipText", RouterManage.textPage, Icons.translate),
    ViewItemBean("VipImage", RouterManage.imagePage, Icons.image),
    ViewItemBean("VipButton", RouterManage.buttonPage, Icons.touch_app),
    ViewItemBean("VipAppbar", RouterManage.appBarPage, Icons.credit_card),
    ViewItemBean("VipTab", RouterManage.tabBarPage, Icons.view_module),
    ViewItemBean("VipBanner", RouterManage.bannerPage, Icons.view_carousel),
    ViewItemBean(
        "VideoController", RouterManage.videoPage, Icons.video_collection),
    ViewItemBean("TextHighLight", RouterManage.textHighLightPage, Icons.light),
  ];

  /*
  * item布局
  * @index 当前条目的索引
  * */
  Widget _itemView(index) {
    return Container(
        // 子元素
        decoration: const BoxDecoration(
            //设置边框，右边和下边
            border: Border(
          top: BorderSide.none,
          bottom:
              BorderSide(width: 1, color: Color.fromRGBO(233, 233, 233, 0.8)),
          left: BorderSide.none,
          right:
              BorderSide(width: 1, color: Color.fromRGBO(233, 233, 233, 0.8)),
        )),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            //view item的点击事件
            _itemClick(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(listData[index].icon, color: Colors.red),
              VipText(listData[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ));
  }

  /*
  * item点击事件
  * @param index 当前条目的索引
  * */
  void _itemClick(index) {
    RouterUtil.pushNamed(listData[index].path);
  }

  @override
  String getTitle() {
    return "";
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  Widget getBody(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // 定义列
            crossAxisCount: 3),
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) => _itemView(index));
  }
}
