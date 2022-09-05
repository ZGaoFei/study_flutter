import 'package:flutter/material.dart';
import 'package:study_flutter/animation/animation_widgets.dart';
import 'package:study_flutter/animation/radial_expansion_demo.dart';
import 'package:study_flutter/customer_widget/customer_test.dart';
import 'package:study_flutter/customer_widget/gobang_test.dart';
import 'package:study_flutter/customer_widget/progress_indicator_test.dart';
import 'package:study_flutter/item_main.dart';
import 'package:study_flutter/list_view_listener/list_view_customer.dart';
import 'package:study_flutter/list_view_listener/list_view_notification.dart';
import 'package:study_flutter/list_view_listener/list_view_scroll_controller.dart';
import 'package:study_flutter/page_view/page_view.dart';
import 'package:study_flutter/provider/simple_provider/shop_widget.dart';
import 'package:study_flutter/provider/test_provider/widget/change_notification_proxy_provider_widget.dart';
import 'package:study_flutter/provider/test_provider/widget/change_notification_widget.dart';
import 'package:study_flutter/provider/test_provider/widget/future_provider_widget.dart';
import 'package:study_flutter/provider/test_provider/widget/multi_provider_widget.dart';
import 'package:study_flutter/provider/test_provider/widget/proxy_provider_widget.dart';
import 'package:study_flutter/provider/test_provider/widget/stream_provider_widget.dart';
import 'package:study_flutter/web_view/web_view_test.dart';

Map<String, WidgetBuilder> getRoutes() {
  Map<String, WidgetBuilder> map = {};
  var routes = getAllRoutes();
  for (var route in routes) {
    for (var element in route) {
      map[element.scheme] = (context) => element.widget;
    }
  }
  return map;
}

///所有的route
List<List<Route>> getAllRoutes() {
  return [
    getTitles(),
    getListView(),
    getProviders(),
    getAnimationView(),
    getCustomer(),
  ];
}

///一级页标题
List<Route> getTitles() {
  return [
    ///Animation
    Route("animation", "Animation test",
        ItemMain(title: 'Animation', routes: getAnimationView())),

    ///ListView
    Route("list_view", "ListView",
        ItemMain(title: 'ListView', routes: getListView())),

    Route("page_view", "Page view", const PageViewWidget()),
    Route("simple_provider", "Simple provider test", const ShopWidget()),

    ///provider
    Route("provider_test", "Provider test",
        ItemMain(title: 'Provider', routes: getProviders()),
        color: Colors.lightBlue),

    ///webview
    Route("web_view_test", "WebView test", const WebViewTest()),

    Route("customer_view", "Customer widget", ItemMain(title: 'Customer widget', routes: getCustomer())),
  ];
}

///二级页动画标题
List<Route> getAnimationView() {
  return [
    Route("radial_expansion", "radial expansion hero",
        const RadialExpansionDemo()),
    Route("animation_widgets", "预置Animation widget", const AnimationWidgets()),
  ];
}

///二级页listView标题
List<Route> getListView() {
  return [
    Route("list_view_scroll_controller", "ListView scrollController",
        const ListViewScrollController()),
    Route("list_view_notification_listener", "ListView notification listener",
        const ListViewNotification()),
    Route("list_view_customer", "ListView customer", const ListViewCustomer()),
  ];
}

///二级页provider标题
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

///二级页Customer widget
List<Route> getCustomer() {
  return [
    Route("customer_widget", "Customer widget", const CustomerTest()),
    Route("gobang", "Gobang", const GobangTest()),
    Route("progress_indicator", "Progress Indicator", const ProgressIndicatorTest()),
  ];
}

class Route {
  String scheme;
  String title;
  Widget widget;
  Color color;

  Route(this.scheme, this.title, this.widget, {this.color = Colors.black});
}
