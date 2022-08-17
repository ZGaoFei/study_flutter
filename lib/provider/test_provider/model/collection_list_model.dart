import 'package:flutter/material.dart';
import 'package:study_flutter/provider/test_provider/model/list_model.dart';

import 'shop_model.dart';

class CollectionListModel extends ChangeNotifier {
  // 依赖ListModel
  final ListModel _listModel;

  CollectionListModel(this._listModel);

  // 所有收藏的商品
  List<ShopModel> shops = [];

  // 添加收藏
  void add(ShopModel shop) {
    shops.add(shop);
    notifyListeners();
  }

  // 移除收藏
  void remove(ShopModel shop) {
    shops.remove(shop);
    notifyListeners();
  }
}
