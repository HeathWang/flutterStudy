import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CookBook',
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => MyMenuPage(),
      },
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}

class MyMenuPage extends StatelessWidget {

  final menus = [
    'Displaying SnackBars',
    'Working with Tabs',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CookBook'),),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(menus[index]),
                  onTap: (){

                  },
                ),
                Divider(height: 0.5,)
              ],
            );
          },
        itemCount: menus.length,
      ),
    );
  }
}
