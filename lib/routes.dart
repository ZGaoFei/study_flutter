import 'package:flutter/material.dart';
import 'package:study_flutter/animation/radial_expansion_demo.dart';
import 'package:study_flutter/list_view_listener/list_view_customer.dart';
import 'package:study_flutter/list_view_listener/list_view_main.dart';
import 'package:study_flutter/list_view_listener/list_view_notification.dart';
import 'package:study_flutter/list_view_listener/list_view_scroll_controller.dart';
import 'package:study_flutter/page_view/page_view.dart';
import 'package:study_flutter/provider/simple_provider/shop_widget.dart';
import 'package:study_flutter/provider/test_provider/provider_main.dart';
import 'package:study_flutter/provider/test_provider/widget/change_notification_proxy_provider_widget.dart';
import 'package:study_flutter/provider/test_provider/widget/change_notification_widget.dart';
import 'package:study_flutter/provider/test_provider/widget/future_provider_widget.dart';
import 'package:study_flutter/provider/test_provider/widget/multi_provider_widget.dart';
import 'package:study_flutter/provider/test_provider/widget/proxy_provider_widget.dart';
import 'package:study_flutter/provider/test_provider/widget/stream_provider_widget.dart';

Map<String, WidgetBuilder> getRoutes() {
  Map<String, WidgetBuilder> map = {};
  var titles = getTitles();
  for (var element in titles) {
    map[element.scheme] = (context) => element.widget;
  }
  var listView = getListView();
  for (var element in listView) {
    map[element.scheme] = (context) => element.widget;
  }
  var providers = getProviders();
  for (var element in providers) {
    map[element.scheme] = (context) => element.widget;
  }
  return map;
}

List<Route> getTitles() {
  return [
    Route("radial_expansion", "radial expansion hero",
        const RadialExpansionDemo()),

    ///ListView
    Route("list_view", "ListView",
        const ListViewMain()),

    Route("page_view", "Page view", const PageViewWidget()),
    Route("simple_provider", "Simple provider test", const ShopWidget()),

    ///provider
    Route("provider_test", "Provider test", const ProviderMain(),
        color: Colors.lightBlue),
  ];
}

List<Route> getListView() {
  return [
    Route("list_view_scroll_controller", "ListView scrollController",
        const ListViewScrollController()),
    Route("list_view_notification_listener", "ListView notification listener",
        const ListViewNotification()),
    Route("list_view_customer", "ListView customer", const ListViewCustomer()),
  ];
}

List<Route> getProviders() {
  return [
    Route("change_notification_provider", "ChangeNotificationProvider test",
        const ChangeNotificationWidget(),
        color: Colors.lightBlue),
    Route("test_future_provider", "FutureProvider test",
        const FutureProviderWidget(),
        color: Colors.lightBlue),
    Route("test_stream_provider", "StreamProvider test",
        const StreamProviderWidget(),
        color: Colors.lightBlue),
    Route("test_multi_provider", "MultiProvider test",
        const MultiProviderWidget(),
        color: Colors.lightBlue),
    Route("test_proxy_provider", "ProxyProvider test",
        const ProxyProviderWidget(),
        color: Colors.lightBlue),
    Route(
        "change_notification_proxy_provider",
        "ChangeNotificationProxyProvider test",
        const ChangeNotificationProxyProviderWidget(),
        color: Colors.lightBlue),
  ];
}

class Route {
  String scheme;
  String title;
  Widget widget;
  Color color;

  Route(this.scheme, this.title, this.widget, {this.color = Colors.black});
}
