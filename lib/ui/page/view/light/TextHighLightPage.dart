import 'package:flutter/material.dart';
import 'package:flutter_widget/base/base_page_state.dart';
import 'package:flutter_widget/ui/widget/text_high_light.dart';

///AUTHOR:AbnerMing
///DATE:2023/8/14
///INTRODUCE:组件高亮

class TextHighLightPage extends StatefulWidget {
  const TextHighLightPage({super.key});

  @override
  State<StatefulWidget> createState() => TextHighLightPageState();
}

class TextHighLightPageState extends BasePageState {
  final TextEditingController _textControllerContent = TextEditingController();

  final String _content = "床前明月光，疑是地上霜，举头望明月，低头思故乡。";

  String searchContent = ""; //搜索内容

  @override
  Widget getBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: TextField(
              controller: _textControllerContent,
              style: const TextStyle(fontSize: 13),
              onChanged: (e) {
                //搜索内容
                setState(() {
                  searchContent = e;
                });
              },
              decoration: InputDecoration(
                hintText: "搜索内容",
                border: OutlineInputBorder(),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          Container(
              height: 300,
              margin: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextHighlight(
                        _content,
                        searchContent,
                        const TextStyle(color: Colors.black),
                        const TextStyle(color: Colors.red),
                      ),
                    );
                  }))
        ],
      ),
    );
  }

  @override
  String getTitle() {
    return "内容高亮";
  }
}
