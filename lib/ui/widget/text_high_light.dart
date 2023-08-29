import 'package:flutter/material.dart';

class TextHighlight extends StatelessWidget {
  final TextStyle _ordinaryStyle; //普通的样式
  final TextStyle _highlightStyle; //高亮的样式
  final String _content; //文本内容
  final String _searchContent; //搜索的内容

  const TextHighlight(this._content, this._searchContent, this._ordinaryStyle,
      this._highlightStyle,
      {super.key});

  @override
  Widget build(BuildContext context) {
    //搜索内容为空
    if (_searchContent == "") {
      return Text(
        _content,
        style: _ordinaryStyle,
      );
    }
    List<TextSpan> richList = [];
    int start = 0;
    int end;

    //遍历，进行多处高亮
    while ((end = _content.indexOf(_searchContent, start)) != -1) {
      //如果搜索内容在开头位置，直接高亮，此处不执行
      if (end != 0) {
        richList.add(TextSpan(
            text: _content.substring(start, end), style: _ordinaryStyle));
      }
      //高亮内容
      richList.add(TextSpan(text: _searchContent, style: _highlightStyle));
      //赋值索引
      start = end + _searchContent.length;
    }
    //搜索内容只有在开头或者中间位置，才执行
    if (start != _content.length) {
      richList.add(TextSpan(
          text: _content.substring(start, _content.length),
          style: _ordinaryStyle));
    }

    return RichText(
      text: TextSpan(children: richList),
    );
  }
}
