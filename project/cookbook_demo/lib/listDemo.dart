import 'package:flutter/material.dart';

class HorizontalListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal List')),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 100.0),
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          height: 250.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(width: 160.0, color: Colors.red),
              Container(width: 160.0, color: Colors.blue),
              Container(width: 160.0, color: Colors.yellow),
              Container(width: 160.0, color: Colors.purple),
              Container(width: 160.0, color: Colors.blueAccent),
            ],
          ),
        ),
      ),
    );
  }
}
