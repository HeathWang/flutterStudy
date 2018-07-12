import 'package:flutter/animation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ThreadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThreadPageState();
  }
}

class _ThreadPageState extends State<ThreadPage> {
  List widgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asynchronous Demo'),
      ),
      body: Center(
        child: _getBodyUI(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData() async {
    String apiURL = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(apiURL);
    // update ui
    setState(() {
      widgets = json.decode(response.body);
    });
  }

  bool showLoadingDialog() {
    if (widgets.length > 0) return false;

    return true;
  }

  Widget _getBodyUI() {
    if (showLoadingDialog()) {
      return _getProgressDialog();
    } else {
      return _getListView();
    }
  }

  Widget _getProgressDialog() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  ListView _getListView() {
    return ListView.builder(
      itemBuilder: (BuildContext content, int index) {
        return _getRow(index);
      },
      itemCount: widgets.length,
    );
  }

  Widget _getRow(int index) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('${widgets[index]["title"]}'),
        ),
        Divider(height: 1.0),
      ],
    );
  }
}
