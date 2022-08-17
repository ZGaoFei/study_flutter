import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter/provider/test_provider/model/phone_model_provider.dart';
import 'package:study_flutter/provider/test_provider/model/phone_model.dart';
import 'package:study_flutter/provider/test_provider/model/user_model.dart';
import 'package:study_flutter/provider/test_provider/model/user_model_provider.dart';

///测试MultiProvider，多个ChangeNotifierProvider
class MultiProviderWidget extends StatefulWidget {
  const MultiProviderWidget({Key? key}) : super(key: key);

  @override
  State<MultiProviderWidget> createState() => _MultiProviderWidgetState();
}

class _MultiProviderWidgetState extends State<MultiProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stream Provider test'),
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<UserModelProvider>(
                create: ((context) =>
                    UserModelProvider(UserModel(name: "老王", age: 18, sex: 0)))),
            ChangeNotifierProvider<PhoneModelProvider>(
                create: ((context) => PhoneModelProvider(
                    PhoneModel(name: "老王", cpu: "888", price: 9999)))),
          ],
          child: Center(
            child: Column(
              children: [
                Consumer<UserModelProvider>(builder: ((context, value, child) {
                  var sex = value.user.sex == 0 ? '男' : '女';
                  return Text(
                      "user info: name is ${value.user.name}, age is ${value.user.age}, sex is $sex");
                })),
                Consumer<PhoneModelProvider>(builder: ((context, value, child) {
                  return Text(
                      "phone info: name is ${value.model.name}, cpu is ${value.model.cpu}, price is ${value.model.price}");
                })),
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
                Consumer<PhoneModelProvider>(builder: ((context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      value.model =
                          PhoneModel(name: "诺基亚", cpu: "888", price: 9999);
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      alignment: Alignment.center,
                      color: Colors.lightBlue,
                      child: const Text(
                        "set phone",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  );
                })),
              ],
            ),
          ),
        ));
  }
}
