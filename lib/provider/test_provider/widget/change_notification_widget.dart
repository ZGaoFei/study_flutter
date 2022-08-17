import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter/provider/test_provider/model/user_model.dart';
import 'package:study_flutter/provider/test_provider/model/user_model_provider.dart';

///测试Provider.ChangeNotificationProvider，使用ChangeNotifier
class ChangeNotificationWidget extends StatefulWidget {
  const ChangeNotificationWidget({Key? key}) : super(key: key);

  @override
  State<ChangeNotificationWidget> createState() =>
      _ChangeNotificationWidgetState();
}

class _ChangeNotificationWidgetState extends State<ChangeNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Notification Provider Test"),
      ),
      body: ChangeNotifierProvider<UserModelProvider>(
        create: ((context) =>
            UserModelProvider(UserModel(age: 18, sex: 0, name: "老王"))),
        child: Center(
          child: Column(
            children: [
              Consumer<UserModelProvider>(builder: ((context, value, child) {
                var sex = value.user.sex == 0 ? '男' : '女';
                return Text(
                    "user info: name is ${value.user.name}, age is ${value.user.age}, sex is $sex");
              })),
              Consumer<UserModelProvider>(builder: ((context, value, child) {
                return GestureDetector(
                  onTap: () {
                    value.user = UserModel(sex: 1, name: "老赵", age: 18);
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    alignment: Alignment.center,
                    color: Colors.lightBlue,
                    child: const Text(
                      "set user",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              })),
            ],
          ),
        ),
      ),
    );
  }
}
