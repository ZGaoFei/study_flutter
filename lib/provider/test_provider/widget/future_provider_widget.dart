import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter/provider/test_provider/model/user_model.dart';

///FutureProvider测试，直接使用model
class FutureProviderWidget extends StatefulWidget {
  const FutureProviderWidget({Key? key}) : super(key: key);

  @override
  State<FutureProviderWidget> createState() => _FutureProviderWidgetState();
}

class _FutureProviderWidgetState extends State<FutureProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider test'),
      ),
      body: FutureProvider<UserModel>(
        create: (context) {
          return Future.delayed(const Duration(seconds: 5), () {
            return UserModel(name: "老赵", sex: 1, age: 18);
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
