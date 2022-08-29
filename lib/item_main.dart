import 'package:flutter/material.dart' hide Route;
import 'package:study_flutter/routes.dart';

///提供通用的item列表页
class ItemMain extends StatelessWidget {
  ItemMain({Key? key, required this.title, required this.routes}) : super(key: key);

  String title;
  List<Route> routes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
          itemCount: routes.length),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    var item = routes[index];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(item.scheme);
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Text(
          item.title,
          style: TextStyle(color: item.color, fontSize: 15),
        ),
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(
      height: 1,
      child: ColoredBox(
        color: Colors.grey,
      ),
    );
  }
}
