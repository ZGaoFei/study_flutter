import 'package:flutter/material.dart';

///使用NotificationListener监听ListView滑动
class ListViewNotification extends StatefulWidget {
  const ListViewNotification({Key? key}) : super(key: key);

  @override
  State<ListViewNotification> createState() => _ListViewNotificationState();
}

class _ListViewNotificationState extends State<ListViewNotification> {
  final List<String> _list = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 40; i++) {
      _list.add("item is $i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        print("zgf ==notification==${notification.metrics}");
        print("zgf ==metrics==${notification.metrics.atEdge}");
        print("zgf ==position==${notification.metrics.maxScrollExtent} ==${notification.metrics.minScrollExtent}");
        print("zgf ==position==${notification.metrics.pixels} ==${notification.metrics.viewportDimension}");
        print("zgf ==position==${notification.metrics.extentBefore} ==${notification.metrics.extentInside} ==${notification.metrics.extentAfter}");
        print("zgf ==position==${notification.metrics.atEdge} ==${notification.metrics.extentInside}");
        return false;
      },
      child: ListView.builder(
          itemCount: _list.length,
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
          })),
    );
  }
}
