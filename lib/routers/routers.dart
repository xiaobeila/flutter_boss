
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import './router_handler.dart';

class Routes {
  static String root = "/";
  static String job = "/job";
  static String webViewPage = '/web-view-page';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        });
    router.define(job, handler: jobHandler);

    router.define('/404', handler: widgetNotFoundHandler);
    router.define(webViewPage,handler:webViewPageHand);
  }
}