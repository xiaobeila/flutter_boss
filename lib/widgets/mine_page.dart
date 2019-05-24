import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('我 的',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
    );
  }
}
