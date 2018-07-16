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

abstract class ListItem {}

class HeadingItem extends ListItem {
  final String heading;

  HeadingItem(this.heading);

}

class MessageItem extends ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

class DifferentCellPage extends StatelessWidget {

  final List<ListItem> list;

  DifferentCellPage({Key key, @required this.list}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Different type cell')),
      body: ListView.builder(
        itemBuilder: (context, i) {
          final item = list[i];

          if (item is HeadingItem) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    item.heading,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline,
                  ),
                ),
                Divider(height: 0.5)
              ],
            );
          } else if (item is MessageItem) {
            return ListTile(
              title: Text(item.sender),
              subtitle: Text(item.body),
            );
          }
        },
        itemCount: list.length,
      ),
    );
  }

}
