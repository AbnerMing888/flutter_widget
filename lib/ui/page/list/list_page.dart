import 'package:flutter/widgets.dart';

///AUTHOR:AbnerMing
///DATE:2023/5/11
///INTRODUCE:列表页面

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return const Text("列表页面");
  }
}
