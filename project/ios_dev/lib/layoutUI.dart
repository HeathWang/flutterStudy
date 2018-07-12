import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Demo'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: CupertinoButton(
          child: Text('Button'),
          onPressed: () {},
          borderRadius: const BorderRadius.all(const Radius.circular(3.0)),
          color: Colors.red,
          minSize: 30.0,
          padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
        ),
      ),
    );
  }
}

class RemoveViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RemoveViewState();
  }


}

class RemoveViewState extends State<RemoveViewPage> {

  bool toggle = true;

  void _toggle() {
    print('execute toggle method.');
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getToggleWidget() {
    print('execute getToggleWidget method!');
    if (toggle) return Text('This is toggle 1');
    return CupertinoButton(child: Text('This is toggle 2'), onPressed: (){}, color: Colors.red,);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Remove UI'),),
      body: Center(
        child: _getToggleWidget(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            _toggle();
          },
        tooltip: 'Change UI',
        child: Icon(Icons.remove),
      ),
    );
  }
}

// How do I build custom widgets?

class CustomButton extends StatelessWidget {
  final String label;

  CustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){},
      child: Text(label),
    );
  }

}

class CustomDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Custom View'),),
      body: Center(
        child: CustomButton('Custom'),
      ),
    );
  }
}

class ImageTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Image Resource')),
      body: Center(
        child: Image(image: AssetImage('images/demo_620X620.jpg')),
      ),
    );
  }
}


