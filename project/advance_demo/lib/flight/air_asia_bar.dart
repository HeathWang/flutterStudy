import 'package:flutter/material.dart';

class AirAsiaBar extends StatelessWidget {

  final double height;

  AirAsiaBar({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Color(0xFFE64C85)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
          ),
          height: height,
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: Text('AirAsia', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

}

class RoundedButton extends StatelessWidget {

  final String title;
  final bool selected;
  final GestureTapCallback onTap;

  RoundedButton({Key key, this.title, this.selected=false, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = selected ? Colors.white : Colors.transparent;
    Color textColor = selected ? Colors.red : Colors.white;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 36.0,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
            ),
            child: Center(
              child: Text(title, style: TextStyle(color: textColor),),
            ),
          ),
        ),
      ),
    );
  }

}