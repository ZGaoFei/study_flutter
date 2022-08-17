import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter/provider/test_provider/model/user_model.dart';

///测试StreamProvider，直接使用model
class StreamProviderWidget extends StatefulWidget {
  const StreamProviderWidget({Key? key}) : super(key: key);

  @override
  State<StreamProviderWidget> createState() => _StreamProviderWidgetState();
}

class _StreamProviderWidgetState extends State<StreamProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider test'),
      ),
      body: StreamProvider<UserModel>(
        create: (context) {
          return Stream<UserModel>.periodic(const Duration(seconds: 1), (value) {
            return UserModel(name: "老赵", sex: 1, age: 18 + value);
          });
        },
        initialData: UserModel(name: "老王", sex: 0, age: 18),
        child: Consumer<UserModel>(builder: ((context, value, child) {
          var sex = value.sex == 0 ? '男' : '女';
          return Text(
              "user info: name is ${value.name}, age is ${value.age}, sex is $sex");
        })),
      ),
    );
  }
}
