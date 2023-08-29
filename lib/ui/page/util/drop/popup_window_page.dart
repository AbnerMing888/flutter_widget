import 'package:flutter/material.dart';
import 'package:flutter_widget/base/base_page_state.dart';
import 'package:flutter_widget/base/base_widget.dart';
import 'package:flutter_widget/ui/widget/vip_text.dart';
import 'package:flutter_widget/utils/popup_window.dart';

class PopupWindowPage extends StatefulWidget {
  const PopupWindowPage({super.key});

  @override
  State<StatefulWidget> createState() => DropDownMenuPageState();
}

class DropDownMenuPageState extends BasePageState {
  final GlobalKey _key = GlobalKey();
  int _number = 0;

  @override
  Widget getBody(BuildContext context) {
    return Center(
      child: VipText(
        "弹出菜单",
        key: _key,
        onClick: () {
          if (_number > 7) {
            _number = 0;
          }
          var direction = WindowDirection.left;
          switch (_number) {
            case 1:
              direction = WindowDirection.top;
              break;
            case 2:
              direction = WindowDirection.right;
              break;
            case 3:
              direction = WindowDirection.bottom;
              break;
            case 4:
              direction = WindowDirection.topLeft;
              break;
            case 5:
              direction = WindowDirection.topRight;
              break;
            case 6:
              direction = WindowDirection.bottomRight;
              break;
            case 7:
              direction = WindowDirection.bottomLeft;
              break;
          }
          PopupWindow.create(
              _key,
              const BaseWidget(
                width: 100,
                height: 100,
                backgroundColor: Colors.black,
              ),
              direction: direction,
              margin: 10,
              childWidth: 100,
              childHeight: 100);

          _number++;
        },
      ),
    );
  }

  @override
  String getTitle() {
    return "弹出框";
  }

  @override
  void destroy() {
    PopupWindow.hint();
    super.destroy();
  }
}
