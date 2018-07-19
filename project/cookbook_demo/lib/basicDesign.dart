import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

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


class TabsViewDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabs Demo'),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.directions_bike)),
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
          ]),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),

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

class MyFadeImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Placeholder'),),
      body: Stack(
        children: <Widget>[
          Center(child: CircularProgressIndicator()),
          Center(
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true'
            ),
          ),
        ],
      ),
    );
  }

}

class CacheImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cache Image'),),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: 'https://pic4.zhimg.com/50/v2-751916a21b95efa0da2b819dcc257c4c_hd.jpg',
          placeholder: CircularProgressIndicator(),
        ),
      ),

    );
  }

}

class FirstPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Container(
        child: GestureDetector(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
                'https://pic4.zhimg.com/v2-8a38d71f786375a28fc0c2cea2bb2fee_b.jpg'),
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SecondPage()));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'imageHero',
          child: GestureDetector(
            child: Image.network(
                'https://pic4.zhimg.com/v2-8a38d71f786375a28fc0c2cea2bb2fee_b.jpg'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }

}

class TextFieldListenerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFieldListenerDemoState();
  }


}

class _TextFieldListenerDemoState extends State<TextFieldListenerDemo> {

  final textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    textController.addListener(_listenTextField);
    super.initState();
  }

  @override
  void dispose() {
    textController.removeListener(_listenTextField);
    textController.dispose();
    super.dispose();
  }

  void _listenTextField() {
    print('TextField text: ${textController.text}');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Handling changes to a text field')),
      body: Center(
        child: TextField(
          controller: textController,
        ),
      ),
    );
  }

}

class FocusTextFieldDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FocusTextFieldDemoState();
  }

}

class _FocusTextFieldDemoState extends State<FocusTextFieldDemo> {

  final focusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Focus TextField'),),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'auto focus'
              ),
            ),
            TextField(
              focusNode: focusNode,
              decoration: InputDecoration(
                  labelText: 'focus node'
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(focusNode);
        },
        child: Icon(Icons.directions),
      ),
    );
  }

}

class MyCustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCustomFormState();
  }

}

class _MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Validate Form'),),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter something.';
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Builder(builder: (context) {
                return RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text('Submit'),
                );
              }),

            ),
          ],
        ),
      ),
    );
  }

}

