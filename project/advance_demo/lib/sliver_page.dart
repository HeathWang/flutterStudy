import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {

  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 256.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('SliverFab Example'),
                  background: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset('images/conver.jpg', fit: BoxFit.cover,),
                      DecoratedBox(decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: const <Color>[const Color(0x60000000), const Color(0x00000000)],
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, -0.4),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(20, (int index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  }),
                ),
              ),
            ],
          ),
          _buildFb(),
        ],
      ),
    );
  }

  Widget _buildFb() {
    final double defaultTopMargin = 256.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 96.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;

    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;

      if (offset < defaultTopMargin - scaleStart) {
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add),),
      ),
    );
  }
}