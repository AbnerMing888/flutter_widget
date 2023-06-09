import 'package:flutter/material.dart';

import '../../../../base/base_page_state.dart';
import '../../../../constants/color_constant.dart';
import '../../../../constants/dimen_constant.dart';
import '../../../../constants/image_constant.dart';
import '../../../../constants/string_constant.dart';
import '../../../../utils/hex_color.dart';
import '../../../../utils/toast.dart';
import '../../../widget/dashed_border.dart';
import '../../../widget/vip_button.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/12
///INTRODUCE:Button组件效果页面

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<StatefulWidget> createState() => _ButtonPageState();
}

class _ButtonPageState extends BasePageState {
  @override
  Widget getBody(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getVipButton(StringConstant.mainButton,
                solidColor: HexColor(ColorConstant.color_74d1d7),
                color: Colors.white),
            getVipButton(
              StringConstant.mainLoadingButton,
              solidColor: HexColor(ColorConstant.color_74d1d7),
              color: Colors.white,
              isLeftLoading: true,
            ),
            getVipButton(StringConstant.mainDisabledButton,
                solidColor: HexColor(ColorConstant.color_d4d4d4),
                color: Colors.white),
            getVipButton(StringConstant.secondaryButton,
                strokeColor: HexColor(ColorConstant.color_74d1d7),
                color: HexColor(ColorConstant.color_74d1d7)),
            getVipButton(
              StringConstant.secondaryLoadingButton,
              strokeColor: HexColor(ColorConstant.color_74d1d7),
              color: HexColor(ColorConstant.color_74d1d7),
              isLeftLoading: true,
              leftLoadingImage: ImageConstant.buttonSelectProgress,
            ),
            getVipButton(StringConstant.secondaryDisabledButton,
                strokeColor: HexColor(ColorConstant.color_d4d4d4),
                color: HexColor(ColorConstant.color_d4d4d4)),
            getVipButton(StringConstant.warningButton,
                strokeColor: HexColor(ColorConstant.color_f64749),
                color: HexColor(ColorConstant.color_f64749)),
            getVipButton(StringConstant.warningLoadingButton,
                strokeColor: HexColor(ColorConstant.color_f64749),
                color: HexColor(ColorConstant.color_f64749),
                isLeftLoading: true,
                leftLoadingImage: ImageConstant.buttonWarnProgress),
            getVipButton(StringConstant.warningDisabledButton,
                strokeColor: HexColor(ColorConstant.color_d4d4d4),
                color: HexColor(ColorConstant.color_d4d4d4)),
            Row(children: [
              Expanded(
                  flex: 1,
                  child: getVipButton(StringConstant.savePhotoButton,
                      strokeColor: HexColor(ColorConstant.color_74d1d7),
                      color: HexColor(ColorConstant.color_74d1d7),
                      leftIcon: ImageConstant.buttonLeftDownLoad)),
              Expanded(
                  flex: 1,
                  child: getVipButton(StringConstant.sendInviteButton,
                      solidColor: HexColor(ColorConstant.color_74d1d7),
                      color: Colors.white,
                      marginLeft: 10.0,
                      leftIcon: ImageConstant.buttonLeftSendInvite))
            ]),
            VipButton(
              StringConstant.gradientButton,
              height: DimenConstant.dimen_44,
              radius: DimenConstant.dimen_44,
              solidColor: HexColor(ColorConstant.color_74d1d7),
              style: const TextStyle(color: Colors.white),
              marginTop: DimenConstant.dimen_10,
              gradient: 0,
              gradientColorList: [
                HexColor(ColorConstant.color_74d1d7),
                HexColor(ColorConstant.color_44b9c0)
              ],
              gradientColorStops: const [0, 1],
              onClick: () {
                Toast.toast(context, msg: StringConstant.gradientButton);
              },
            ),
            Container(
                margin: const EdgeInsets.only(top: DimenConstant.dimen_10),
                child: CustomPaint(
                  painter: DashedBorder(),
                  child: Container(
                    height: DimenConstant.dimen_44,
                  ),
                ))
          ],
        ));
  }

  Widget getLine() {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(10, (_) {
        return Container(
          width: 10,
          height: 1,
          margin: const EdgeInsets.only(top: DimenConstant.dimen_22),
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
          ),
        );
      }),
    );
  }

  /*
  * 返回VipButton
  * */
  VipButton getVipButton(String text,
      {strokeColor,
      solidColor,
      color,
      isLeftLoading,
      leftLoadingImage,
      marginLeft,
      leftIcon}) {
    return VipButton(
      text,
      alignment: Alignment.center,
      height: DimenConstant.dimen_44,
      marginTop: DimenConstant.dimen_10,
      strokeColor: strokeColor,
      solidColor: solidColor,
      radius: DimenConstant.dimen_44,
      style: TextStyle(color: color),
      isLeftLoading: isLeftLoading,
      leftLoadingImage: leftLoadingImage,
      leftIcon: leftIcon,
      marginLeft: marginLeft,
      onClick: () {
        //点击事件
        Toast.toast(context, msg: text);
      },
    );
  }

  @override
  String getTitle() {
    return "Button";
  }
}
