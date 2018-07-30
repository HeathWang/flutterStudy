import 'package:flutter/material.dart';
import 'sliver_page.dart';
import 'filter_menu.dart';

void main() => runApp(MyHomeList());


class MyHomeList extends StatelessWidget {

  final demos = ['DYNAMIC SLIVER FLOATINGACTIONBUTTON',
  'FILTER MENU – UI CHALLENGE'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/sliver': (_) => MyHomePage(),
        '/ui_challenge': (_) => FilterMainPage(),

      },
      home: Scaffold(
        appBar: AppBar(title: Text('Home'),),
        body: ListView.builder(
            itemBuilder: (context, i) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(title: Text(demos[i]), onTap: (){
                    tapCell(i, context);
                  },),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(),
                  ),
                ],
              );
            },
          itemCount: demos.length,
        ),
      ),
    );
  }

  void tapCell(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed('/sliver');
        break;
      case 1:
        Navigator.of(context).pushNamed('/ui_challenge');

    }
  }

}

