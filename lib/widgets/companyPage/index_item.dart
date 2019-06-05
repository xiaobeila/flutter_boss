import 'package:flutter/material.dart';

import 'package:flutter_boss/model/company.dart';
import 'package:flutter_boss/routers/application.dart';
import 'package:flutter_boss/routers/routers.dart';

class CompanyItem extends StatelessWidget {
  final Company item;

  const CompanyItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        // _launchURL(itemUrl, context);
        Application.router.navigateTo(context,
            '${Routes.companyDetailPage}?company=${Uri.encodeComponent(item.company)}&logo=${Uri.encodeComponent(item.logo)}');
      },
      child: new Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.only(
            left: 18.0, top: 10.0, right: 18.0, bottom: 10.0),
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Hero(
                      tag: item.logo,
                      child: Image.network(item.logo, width: 40)),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: new Text(item.company,
                            style: new TextStyle(
                                color: Colors.black, fontSize: 16))),
                    new Text(item.info,
                        style: new TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                )
              ],
            ),
            new Container(
              decoration: new BoxDecoration(
                color: new Color(0xFFF6F6F8),
                borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
              ),
              padding: const EdgeInsets.only(
                  top: 3.0, right: 8.0, bottom: 3.0, left: 8.0),
              margin: const EdgeInsets.only(top: 12.0),
              child: Text(
                item.hot,
                style: new TextStyle(color: new Color(0xFF9fa3b0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
