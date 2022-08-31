import 'package:flutter/material.dart';
import 'package:study_flutter/customer_widget/gobang/gobang.dart';

class GobangTest extends StatelessWidget {
  const GobangTest({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('来！下盘棋吧！'),),
      body: Gobang(lines: 18),
    );
  }
}