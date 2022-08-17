import 'package:flutter/material.dart';

///使用自定义ScrollDelegate监听当前屏幕显示的第一条和最后一条
class ListViewCustomer extends StatefulWidget {
  const ListViewCustomer({Key? key}) : super(key: key);

  @override
  State<ListViewCustomer> createState() => _ListViewCustomerState();
}

class _ListViewCustomerState extends State<ListViewCustomer> {
  ScrollController? _controller;
  final List<String> _list = [];

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();

    for (int i = 0; i < 40; i++) {
      _list.add("item is $i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
        controller: _controller,
        cacheExtent: 0.0,
        childrenDelegate: CustomScrollDelegate(
            (BuildContext context, int index) {
              return Container(
                color: index % 2 == 0 ? Colors.blue : Colors.red,
                padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                height: 50,
                child: Text(
                  _list.elementAt(index),
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              );
            },
            itemCount: _list.length,
            scrollCallBack: (int firstIndex, int lastIndex) {
              print("zgf ====$firstIndex ==$lastIndex");
            }));
  }
}

///ListView 自定义滑动监听回调
class CustomScrollDelegate extends SliverChildBuilderDelegate {
  //定义滑动回调监听
  Function(int firstIndex, int lastIndex)? scrollCallBack;

  //构造函数
  CustomScrollDelegate(builder, {required int itemCount, this.scrollCallBack})
      : super(builder, childCount: itemCount);

  @override
  double? estimateMaxScrollOffset(int firstIndex, int lastIndex,
      double leadingScrollOffset, double trailingScrollOffset) {
    if (scrollCallBack != null) {
      scrollCallBack!(firstIndex, lastIndex);
    }
    return super.estimateMaxScrollOffset(
        firstIndex, lastIndex, leadingScrollOffset, trailingScrollOffset);
  }
}
