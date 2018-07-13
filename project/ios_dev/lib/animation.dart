import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class FadeTestPage extends StatefulWidget {

  FadeTestPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FadeTestPageState();
  }
}


class FadeTestPageState extends State<FadeTestPage> with TickerProviderStateMixin {

  AnimationController animationController;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Demo'), backgroundColor: Colors.blueAccent,),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curvedAnimation,
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (animationController.status == AnimationStatus.completed) {
            animationController.reverse(from: 1000.0);
          } else {
            animationController.forward();
          }

        },
        tooltip: 'Animate',
        child: Icon(Icons.brush),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


}

class GestureTestPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GestureTestPageState();
  }


}

class _GestureTestPageState extends State<GestureTestPage>
    with TickerProviderStateMixin {

  AnimationController controller;
  CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Gusture Demo'),),
      body: Center(
        child: GestureDetector(
          child: RotationTransition(
            turns: animation,
            child: FlutterLogo(
              size: 150.0,
            ),
          ),
          onDoubleTap: () {
            if (controller.isCompleted) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

}
