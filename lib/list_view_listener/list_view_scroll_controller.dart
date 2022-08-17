import 'package:flutter/material.dart';

///使用ScrollController监听ListView滑动
class ListViewScrollController extends StatefulWidget {
  const ListViewScrollController({Key? key}) : super(key: key);

  @override
  State<ListViewScrollController> createState() =>
      _ListViewScrollControllerState();
}

class _ListViewScrollControllerState extends State<ListViewScrollController> {
  ScrollController? _controller;

  final List<String> _list = [];

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller!.addListener(() {
      print("zgf ==offset==${_controller!.offset}");
      print("zgf ==position==${_controller!.position.maxScrollExtent} ==${_controller!.position.minScrollExtent}");
      print("zgf ==position==${_controller!.position.pixels} ==${_controller!.position.viewportDimension}");
      print("zgf ==position==${_controller!.position.extentBefore} ==${_controller!.position.extentInside} ==${_controller!.position.extentAfter}");
      print("zgf ==position==${_controller!.position.atEdge} ==${_controller!.position.extentInside}");
    });

    for (int i = 0; i < 40; i++) {
      _list.add("item is $i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _list.length,
        controller: _controller,
        itemBuilder: ((context, index) {
          return Container(
            color: index % 2 == 0 ? Colors.blue : Colors.red,
            padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
            height: 50,
            child: Text(
              _list.elementAt(index),
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          );
        }));
  }
}
