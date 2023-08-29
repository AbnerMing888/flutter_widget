void main() {
  String _content = "1239456789";
  String _searchContent = "8";
  int start = 0;
  int end;
  while ((end = _content.indexOf(_searchContent, start)) != -1) {
    if (end != 0) {
      print(_content.substring(start, end) + "===$end");
    }
    print(_searchContent);
    start = end + _searchContent.length;
  }
  if(start != _content.length){
    print(_content.substring(start, _content.length)+"====$start");
  }

}
