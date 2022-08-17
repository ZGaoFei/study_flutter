import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:study_flutter/provider/simple_provider/change_notification.dart';
import 'package:study_flutter/provider/simple_provider/consumer.dart';

///测试夸组件通信
class ShopWidget extends StatefulWidget {
  const ShopWidget({Key? key}) : super(key: key);

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple provider"),
      ),
      body: Center(
        child: ChangeNotificationProvider<CartModel>(
          data: CartModel(),
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Consumer<CartModel>(builder: ((context, value) {
                    return Text("总价：${value?.totalPrice}");
                  })),
                  Builder(builder: ((context) {
                    return ElevatedButton(
                        onPressed: () {
                            ChangeNotificationProvider.of<CartModel>(context, isListen: false)?.add(Item(price: 10, count: 2));
                        },
                        child: Text("添加商品"));
                  }))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CartModel extends ChangeNotifier {
  final List<Item> _list = [];

  UnmodifiableListView<Item> get list => UnmodifiableListView(_list);

  double get totalPrice => _list.fold(
      0,
      (previousValue, element) =>
          previousValue + element.price * element.count);

  void add(Item item) {
    print("zgf ==add==${item.count} == ${item.price}");
    _list.add(item);
    notifyListeners();
  }
}

class Item {
  Item({this.content, this.price = 0, this.count = 0});

  String? content;
  double price;
  int count;
}
