import 'package:flutter/material.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewState();
}

class _PageViewState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        allowImplicitScrolling: true,
        children: _buildItems(),
      ),
    );
  }

  List<Widget> _buildItems() {
    List<Widget> list = [];
    for (var i = 0; i < 5; i++) {
      list.add(ItemPage(index: i));
    }
    return list;
  }
}

class ItemPage extends StatefulWidget {
  ItemPage({Key? key, required this.index}) : super(key: key);

  int index;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

///使用AutomaticKeepAliveClientMixin缓存页面
class _ItemPageState extends State<ItemPage> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    print("zgf ====build====${widget.index}");
    return Center(
      child: Text(
        "item ${widget.index}",
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
  
}
