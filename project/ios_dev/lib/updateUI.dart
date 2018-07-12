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

