import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('职 位',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
    );
  }
}
