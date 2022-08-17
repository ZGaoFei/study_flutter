import 'package:flutter/material.dart';
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
      home: const MyHomePage(title: 'study flutter'),
      routes: getRoutes(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
          itemCount: getTitles().length),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    var item = getTitles()[index];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(item.scheme);
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Text(
          getTitles()[index].title,
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
