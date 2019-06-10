import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../widgets/404.dart';
import 'package:flutter_boss/widgets/jobPage/index.dart';
import 'package:flutter_boss/widgets/companyPage/detail.dart';
import 'package:flutter_boss/widgets/web_page/web_view_page.dart';

// 职位
var jobHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new JobPage();
  },
);

// 公司详情
var CompanyDetailHandler = new Handler(
  handlerFunc: (BuildContext context, params) {
    String id = params['id']?.first;
    String company = params['company']?.first;
    String logo = params['logo']?.first;
    return new CompanyDetailPage(
      id: id,
      company: company,
      logo: logo,
    );
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
