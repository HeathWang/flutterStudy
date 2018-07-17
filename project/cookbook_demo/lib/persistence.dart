import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistenceDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PersistenceDemoPageState();
  }
}

class _PersistenceDemoPageState extends State<PersistenceDemoPage> {
  int count;

  @override
  void initState() {
    super.initState();

    _loadCount();
  }

  _loadCount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    count = preferences.getInt(kCountKey) ?? 0;

    setState(() {
      count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persistence Demo'),
      ),
      body: Center(
        child: Text('You have pushed the button this many times:$count'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCount,
        child: Icon(Icons.add),
        tooltip: 'Add Count',
      ),
    );
  }

  _addCount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    count++;
    setState(() {
      count;
    });

    preferences.setInt(kCountKey, count);
  }
}

final kCountKey = 'hw_count';
