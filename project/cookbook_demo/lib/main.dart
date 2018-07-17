import 'package:flutter/material.dart';
import 'basicDesign.dart';
import 'listDemo.dart';
import 'httpDemo.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CookBook',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => MyMenuPage(),
        '/snackbar': (BuildContext context) => SnackBarPage(),
        '/tabs': (BuildContext context) => TabsViewDemoPage(),
        '/drawer': (BuildContext context) => MyDrawerPage(),
        '/orientation': (BuildContext context) =>
            OrientationList(title: 'Orientation'),
        '/fadeImage': (BuildContext content) => MyFadeImagePage(),
        '/cacheImage': (BuildContext context) => CacheImageDemo(),
        '/horizontalList': (BuildContext context) => HorizontalListPage(),
        '/diffCells': (BuildContext context) =>
            DifferentCellPage(list: List.generate(1000, (i) {
              if (i % 8 == 0) {
                int index = i ~/ 8;
                return HeadingItem('Heading $index');
              } else {
                return MessageItem('Sender $i', 'Body $i');
              }
            })),
        '/navAnimation': (BuildContext context) => FirstPage(),
        '/fetchData': (BuildContext context) => FetchDataPage(),
      },
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}

class MyMenuPage extends StatelessWidget {
  final menus = [
    'Displaying SnackBars',
    'Working with Tabs',
    'Add a Drawer to a screen',
    'Updating the UI based on orientation',
    'Fade in images with a placeholder',
    'Working with cached images',
    'Create a horizontal list',
    'Creating lists with different types of items',
    'Animating a Widget across screens',
    'Fetch data from the internet',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CookBook'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(menus[index]),
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.of(context).pushNamed('/snackbar');
                      break;
                    case 1:
                      Navigator.of(context).pushNamed('/tabs');
                      break;
                    case 2:
                      Navigator.of(context).pushNamed('/drawer');
                      break;
                    case 3:
                      Navigator.of(context).pushNamed('/orientation');
                      break;
                    case 4:
                      Navigator.of(context).pushNamed('/fadeImage');
                      break;
                    case 5:
                      Navigator.of(context).pushNamed('/cacheImage');
                      break;
                    case 6:
                      Navigator.of(context).pushNamed('/horizontalList');
                      break;
                    case 7:
                      Navigator.of(context).pushNamed('/diffCells');
                      break;
                    case 8:
                      Navigator.of(context).pushNamed('/navAnimation');
                      break;
                    case 9:
                      Navigator.of(context).pushNamed('/fetchData');
                  }
                },
              ),
              Divider(
                height: 0.5,
              )
            ],
          );
        },
        itemCount: menus.length,
      ),
    );
  }
}
