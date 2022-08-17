import 'package:flutter/material.dart';
import 'package:study_flutter/provider/simple_provider/change_notification.dart';

class Consumer<T> extends StatelessWidget {
  Consumer({Key? key, required this.builder}) : super(key: key);

  Widget Function(BuildContext context, T? value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotificationProvider.of<T>(context));
  }
}
