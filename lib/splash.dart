import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_boss/main.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _t;

  @override
  void initState() {
    super.initState();
    _t = Timer(const Duration(milliseconds: 1500), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(PageRouteBuilder<Null>(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget child) {
              return Opacity(
                opacity: animation.value,
                child: MainPage(title: 'Boss 直聘'),
              );
            },
          );
        }), (Route route) => route == null);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 0, 215, 198),
      child: Container(
        alignment: Alignment(0, -0.3),
        child: Text(
          "BOSS直聘",
          style: new TextStyle(
              color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
