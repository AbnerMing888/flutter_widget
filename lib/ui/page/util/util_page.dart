import 'package:flutter/material.dart';

import '../../../constants/dimen_constant.dart';
import '../../../data/bean/view_item_bean.dart';
import '../../../utils/router_manage.dart';
import '../../../utils/router_util.dart';
import '../../widget/vip_text.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/11
///INTRODUCE:工具类页面

class UtilPage extends StatefulWidget {
  const UtilPage({super.key});

  @override
  State<StatefulWidget> createState() => _UtilPageState();
}

class _UtilPageState extends State<UtilPage> {
  final List<ViewItemBean> listData = [
    ViewItemBean("Toast", RouterManage.toastPage, Icons.whatshot),
    ViewItemBean(
        "PopupWindowPage", RouterManage.popupWindowPage, Icons.power_input_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // 定义列
            crossAxisCount: 3),
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) => _itemView(index));
  }

  /*
  * item布局
  * @index 当前条目的索引
  * */
  Widget _itemView(index) {
    return Container(
        // 子元素
        decoration: BoxDecoration(
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
                  marginTop: DimenConstant.dimen_5,
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
}
