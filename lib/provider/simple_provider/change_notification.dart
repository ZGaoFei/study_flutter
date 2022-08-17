import 'package:flutter/material.dart';
import 'package:study_flutter/provider/simple_provider/inherited_provider.dart';

class ChangeNotificationProvider<T extends ChangeNotifier>
    extends StatefulWidget {
  ChangeNotificationProvider(
      {Key? key, required this.data, required this.child})
      : super(key: key);

  final T data;
  final Widget child;

  static T? of<T>(BuildContext context, {bool isListen = true}) {
    final provider = isListen ?
        context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()?.widget as InheritedProvider<T>;
    return provider!.data;
  }

  @override
  _ChangeNotificationProviderState createState() =>
      _ChangeNotificationProviderState<T>();
}

class _ChangeNotificationProviderState<T extends ChangeNotifier>
    extends State<ChangeNotificationProvider<T>> {
  void update() {
    setState(() {});
  }

  @override
  void didUpdateWidget(
      covariant ChangeNotificationProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      widget.data.removeListener(update);
      widget.data.addListener(update);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);

    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider(data: widget.data, child: widget.child);
  }
}
