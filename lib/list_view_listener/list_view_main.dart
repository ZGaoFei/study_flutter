import 'package:flutter/material.dart';
import 'package:study_flutter/routes.dart';

class ListViewMain extends StatelessWidget {
  const ListViewMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("list view"),
      ),
      body: ListView.separated(
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
          itemCount: getListView().length),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    var item = getListView()[index];
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
