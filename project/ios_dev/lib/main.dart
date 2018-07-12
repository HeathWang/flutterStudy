import 'package:flutter/material.dart';
import 'updateUI.dart';
import 'layoutUI.dart';
import 'animation.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }

}

class MainPageState extends State<MainPage> {

  List<String> learnPoints = <String>[
    'How do I update Widgets',
    'How do I lay out my widgets? Where is my Storyboard?',
    'How to Remove UI?',
    'How to Animate?',
    'How do I build custom widgets?'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      title: 'Flutter for iOS Developers',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter for iOS Developers'),
        ),
        body: _buildList(context),
      ),
    );

  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: learnPoints.length,
      itemBuilder: (context, i) {
        return _buildRows(learnPoints[i], context);
      },
    );
  }

  Widget _buildRows(String text, BuildContext context) {

    return Column(
      children: <Widget>[
        ListTile(
          title: Text(text),
          onTap: () {
            int index = learnPoints.indexOf(text);
            switch (index) {
              case 0:
                _gotoUpdatePage(context);
                break;
              case 1:
                Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutPage()));
                break;
              case 2:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RemoveViewPage()));
                break;
              case 3:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FadeTestPage()));
                break;
              case 4:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomDemoPage()));
                break;
            }
          },
        ),
        Divider(height: 1.0),
      ],
    );

  }

  void _gotoUpdatePage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => UpdateUISample())
    );
  }
}
