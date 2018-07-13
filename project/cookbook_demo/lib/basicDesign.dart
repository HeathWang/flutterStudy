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
