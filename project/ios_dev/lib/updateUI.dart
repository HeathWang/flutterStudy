import 'package:flutter/material.dart';


class UpdateUISample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return UpdateUISampleState();
  }

}

class UpdateUISampleState extends State<UpdateUISample> {

  String _textShow = 'I Love Flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('How do I update Widgets'),),
      body: Center(
        child: Text(_textShow),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _textShow = 'We love Flutter';
          });
        },
        tooltip: 'Update',
        child: Icon(Icons.update),
      ),
    );
  }

}

class UpdateListUIPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UpdateListUIPageState();
  }

}

class _UpdateListUIPageState extends State<UpdateListUIPage> {

  List<int> dataList = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 20; i ++) {
      dataList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Update List'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _addData),
          IconButton(icon: Icon(Icons.remove), onPressed: _minusData)
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return _getRow(i);
        },
        itemCount: dataList.length,
      ),
    );
  }


  Widget _getRow(int i) {
    int value = dataList[i];
    return ListTile(
      title: Text('Row: $value'),
    );
  }

  void _addData() {
    setState(() {
      dataList.add(dataList.length);
    });
  }

  void _minusData() {
    setState(() {
      dataList.removeLast();
    });
  }
}

class MyFormTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFormTestPageState();
  }


}

class _MyFormTestPageState extends State<MyFormTestPage> {

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Demo'),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: 'Please input something.',
              labelText: 'This is placeholder'
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: Text(textController.text),);
              }
          );
        },
        tooltip: 'Show me the Value',
        child: Icon(Icons.text_fields),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

}

