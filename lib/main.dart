import 'package:flutter/material.dart';
import 'package:study_flutter/item_main.dart';
import 'package:study_flutter/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemMain(title: 'study flutter', routes: getTitles()),
      routes: getRoutes(),
    );
  }
}