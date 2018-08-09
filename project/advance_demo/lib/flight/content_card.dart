import 'package:flutter/material.dart';
import 'package:advance_demo/flight/multicity_input.dart';
import 'package:advance_demo/flight/price_tab.dart';

class ContentCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContentCardState();
  }

}

class _ContentCardState extends State<ContentCard> {

  bool showInput = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.all(8.0),
      child: DefaultTabController(
          length: 3,
          child: LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Column(
              children: <Widget>[
                _buildTabBar(),
                _buildContentContainer(viewportConstraints),
              ],
            );
          }),
      ),
    );
  }

  Widget _buildTabBar({bool showFirstOption}) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          top: null,
          child: Container(
            height: 1.0,
            color: Color(0xFFEEEEEE),
          ),
        ),
        TabBar(
          tabs: <Widget>[
            Tab(text: "Flight"),
            Tab(text: "Train"),
            Tab(text: "Bus"),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildContentContainer(BoxConstraints viewportConstraints) {
    return Expanded(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight - 48.0
          ),
          child: IntrinsicHeight(
            child: showInput ? _buildMulticityTab() : PriceTab(height: viewportConstraints.maxHeight - 48.0,),
          ),
        ),
      ),
    );
  }


  Widget _buildMulticityTab() {
    return Column(
      children: <Widget>[
        MulticityInput(),
        Expanded(child: Container()),
        Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
          child: FloatingActionButton(onPressed: (){
            setState(() {
              showInput = !showInput;
              print('$showInput');
            });
          },
            child: Icon(Icons.timeline,size: 36.0,),
          ),
        ),
      ],
    );
  }

}