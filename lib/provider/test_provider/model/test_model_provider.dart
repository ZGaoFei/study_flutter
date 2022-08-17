import 'package:flutter/foundation.dart';

///测试数据类，在添加时要调用notifyListeners
class TestProviderModel with ChangeNotifier {
  int _num = 0;
  String _content = "";

  int get num => _num;
  String get content => _content;

  set num(int num) {
    _num = num;
    notifyListeners();
  }

  set content(String content) {
    _content = content;
    notifyListeners();
  }
}
