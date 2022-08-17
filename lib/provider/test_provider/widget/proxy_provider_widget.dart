import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter/provider/test_provider/model/eat_model.dart';
import 'package:study_flutter/provider/test_provider/model/user_model.dart';
import 'package:study_flutter/provider/test_provider/model/user_model_provider.dart';


///ProxyProvider测试，一个model依赖另一个model
class ProxyProviderWidget extends StatefulWidget {
  const ProxyProviderWidget({Key? key}) : super(key: key);

  @override
  State<ProxyProviderWidget> createState() => _ProxyProviderWidgetState();
}

class _ProxyProviderWidgetState extends State<ProxyProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Proxy Provider test'),
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<UserModelProvider>(
                create: ((context) =>
                    UserModelProvider(UserModel(name: "老王", age: 18, sex: 0)))),
            ProxyProvider<UserModelProvider, EatModel>(
                update: ((context, value, previous) {
              return EatModel(value.user.name);
            }))
          ],
          child: Center(
            child: Column(
              children: [
                Consumer<EatModel>(builder: ((context, value, child) {
                  return Text("${value.name} is eating");
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
        ));
  }
}
