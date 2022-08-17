import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({required this.data, required Widget child})
      : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(covariant InheritedProvider<T> oldWidget) {
    return true;

    /// return oldWidget.data != data;
  }
}
