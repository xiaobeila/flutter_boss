import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_boss/widgets/jobPage/job_item.dart';
import 'package:flutter_boss/model/job.dart';
import 'package:flutter_boss/common/config/config.dart';

import 'package:flutter_boss/components/list_refresh.dart' as listComp;
import 'package:flutter_boss/common/utils/net_utils.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> with AutomaticKeepAliveClientMixin {
  Future<Map> _fetchJobList([Map<String, dynamic> params]) async {
    const flutterUrl = '${Config.BASE_URL}/jobs/list';
    var pageIndex = (params is Map) ? params['pageIndex'] : 0;
    final _param = {'page': pageIndex};
    var responseList = [];
    var pageTotal = 0;

    try {
      var response = await NetUtils.get(flutterUrl, params: _param);
      responseList = response['data']['jobs'];
      pageTotal = response['data']['pages']['totalPage'];
      if (!(pageTotal is int) || pageTotal <= 0) {
        pageTotal = 0;
      }
    } catch (e) {}
    pageIndex += 1;
    List resultList = new List();
    for (int i = 0; i < responseList.length; i++) {
      try {
        Job cellData = new Job.fromJson(responseList[i]);
        resultList.add(cellData);
      } catch (e) {
        // No specified type, handles all
      }
    }
    Map<String, dynamic> result = {
      "list": resultList,
      'total': pageTotal,
      'pageIndex': pageIndex
    };
    return result;
  }

  @override
  bool get wantKeepAlive => true;

  Widget makeCard(index, item) {
    return new JobItem(item: item);
  }

  headerView() {
    return new Container(
//      child: new Row(
//        children: <Widget>[
//          Expanded(
//            child: new Container(
//              alignment: Alignment.center,
//              child: Text('headerView',
//                style: new TextStyle(color: new Color(0xFF9fa3b0),fontSize: 26.0),
//              ),
//            ),
//          )
//        ],
//      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('职 位',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      body: new Column(children: <Widget>[
        new Expanded(
            child: listComp.ListRefresh(_fetchJobList, makeCard, headerView)
        )
      ],
      ),
    );
  }
}
