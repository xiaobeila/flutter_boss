import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../widgets/404.dart';
import 'package:flutter_boss/widgets/jobPage/index.dart';
import 'package:flutter_boss/widgets/web_page/web_view_page.dart';

// app的首页
var jobHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new JobPage();
  },
);

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WidgetNotFound();
});

var webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return new WebViewPage(url, title);
});
