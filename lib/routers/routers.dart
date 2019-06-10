
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import './router_handler.dart';

class Routes {
  static String root = "/";
  static String job = "/job";
  static String companyDetailPage = "/company-detail-page";
  static String webViewPage = '/web-view-page';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print('ERROR====>ROUTE WAS NOT FONUND!!!');
        });
    router.define(job, handler: jobHandler);
    router.define(companyDetailPage, handler: CompanyDetailHandler);

    router.define('/404', handler: widgetNotFoundHandler);
    router.define(webViewPage,handler:webViewPageHand);
  }
}
