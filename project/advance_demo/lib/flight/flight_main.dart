import 'package:flutter/material.dart';
import 'package:advance_demo/flight/air_asia_bar.dart';
import 'package:advance_demo/flight/content_card.dart';

class FlightMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AirAsiaBar(height: 210.0,),
          Positioned.fill(
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 40.0),
                child: Column(
                  children: <Widget>[
                    _buildButtonRows(),
                    Expanded(
                      child: ContentCard(),
                    ),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRows() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          RoundedButton(title: 'ONE DAY',),
          RoundedButton(title: 'ROUND',),
          RoundedButton(title: 'MULTICITY', selected: true,)
        ],
      ),
    );
  }

}