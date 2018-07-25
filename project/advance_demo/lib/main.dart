import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 256.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('SliverFab Example'),
                  background: Image.asset('images/conver.jpg', fit: BoxFit.cover),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(20, (int index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  }),
                ),
              ),
            ],
          ),
          Positioned(
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            top: 256.0,
            right: 16.0,
          ),
        ],
      ),
    );
  }
}
