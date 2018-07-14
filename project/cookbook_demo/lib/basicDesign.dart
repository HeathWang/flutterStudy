import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snack Bar')),
      body: Builder(builder: (BuildContext content) {
        return Center(
          child: RaisedButton(
            onPressed: () {
              // create a snack bar
              final snackBar = SnackBar(
                content: Text('Yay! A SnackBar!'),
                action: SnackBarAction(label: 'Undo', onPressed: () {}),
              );

              // NOTICE: use inner builder content, NOT context.
              Scaffold.of(content).showSnackBar(snackBar);
            },
            child: Text('Click Me!'),
            padding: EdgeInsets.all(20.0),
          ),
        );
      }),
    );
  }
}

class MyDrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Demo'),
      ),
      body: Center(
        child: Text('My page'),
      ),
      drawer: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Drawer Header"),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text('Row 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Row 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class OrientationList extends StatelessWidget {
  final String title;

  OrientationList({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            children: List.generate(100, (index) {
              return Center(
                child: Text('Row $index'),
              );
            }),
          );
        },
      ),
    );
  }
}
