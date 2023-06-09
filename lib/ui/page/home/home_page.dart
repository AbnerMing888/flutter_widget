import 'package:flutter/material.dart';

import '../../../base/base_page_state.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/11
///INTRODUCE:主页面

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BasePageState {
  @override
  bool showAppBar() {
    return false;
  }

  @override
  String getTitle() {
    return "主页";
  }

  @override
  Widget getBody(BuildContext context) {
    return const Text("主页");
  }
}
