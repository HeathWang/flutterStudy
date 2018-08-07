import 'package:flutter/material.dart';
import 'package:advance_demo/task.dart';
import 'package:advance_demo/task_row.dart';
import 'package:advance_demo/list_model.dart';
import 'package:advance_demo/animated_fab.dart';

class FilterMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FilterMainPageState();
  }

}

class _FilterMainPageState extends State<FilterMainPage> {

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  double _imageHeight = 256.0;
  ListModel listModel;
  bool showOnlyCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildTimeline(),
          _buildImage(),
          _buildTopHeader(context),
          _buildProfileRow(),
          _buildBottomPart(),
          _buildFab(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    listModel = ListModel(_listKey, tasks);
  }

  Widget _buildImage() {
    return Positioned.fill(
      bottom: null,
      child: ClipPath(
        clipper: DialogonalClipper(),
        child: Image.asset('images/birds.jpg',
          fit: BoxFit.cover,
          height: _imageHeight,
          colorBlendMode: BlendMode.srcOver,
          color: Color.fromARGB(120, 20, 10, 40),
        ),
      ),);
  }

  Widget _buildTopHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back, size: 32.0, color: Colors.white,), onPressed: () {
            Navigator.of(context).pop();
          }),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 8.0),
              child: Text(
                  'Time Line',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Icon(Icons.linear_scale, color: Colors.white, size: 32.0,)
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: _imageHeight / 2),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            minRadius: 28.0,
            maxRadius: 28.0,
            backgroundColor: Colors.red,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Ryan Barnes', style: TextStyle(fontSize: 26.0, color: Colors.white, fontWeight: FontWeight.w400),),
                Text('Product designer', style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w300),)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Padding(
      padding: EdgeInsets.only(top: _imageHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMyTasksHeader(),
          _buildTasksList()
        ],
      ),
    );
  }

  Widget _buildMyTasksHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'My Tasks',
            style: TextStyle(
              fontSize: 34.0
            ),
          ),
          Text(
            'FEBRUARY 8, 2015',
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksList() {
    return Expanded(
      child: AnimatedList(
          itemBuilder: (context, index, animation) {
            return TaskRow(task: listModel[index], animation: animation,);
          },
        initialItemCount: tasks.length,
        key: _listKey,
      ),
    );
  }

  Widget _buildTimeline() {
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 32.0,
      child: Container(
        width: 1.0,
        color: Colors.grey[300],
      ),
    );
  }

  Widget _buildFab() {
    return Positioned(
      top: _imageHeight - 100,
      right: -40.0,
      child: AnimatedFab(onClick: _changeFilterState,),
    );
  }

  _changeFilterState() {

    showOnlyCompleted = !showOnlyCompleted;
    tasks.where((task) => !task.completed).forEach((task) {
      if (showOnlyCompleted) {
        listModel.removeAt(listModel.indexOf(task));
      } else {
        listModel.insert(tasks.indexOf(task), task);
      }
    });
  }

}

class DialogonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 60);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}

