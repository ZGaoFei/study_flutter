import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewTest extends StatefulWidget {
  const WebViewTest({Key? key}) : super(key: key);

  @override
  State<WebViewTest> createState() => _WebViewTestState();
}

class _WebViewTestState extends State<WebViewTest> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('web view')),
      body: WebView(
        initialUrl: 'https://blog.csdn.net/LiErDan/article/details/111355232',
        onPageFinished: (String url) {
          print('zgf =====onPageFinished=====');
        },
        onProgress: (int progress) {
          print('zgf =====onProgress=====$progress');
        },
      ),
    );
  }
}
