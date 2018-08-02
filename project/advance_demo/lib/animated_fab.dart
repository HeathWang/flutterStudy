import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedFab extends StatefulWidget {

  final VoidCallback onClick;
  AnimatedFab({Key key, this.onClick}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimatedFabState();
  }

}

class _AnimatedFabState extends State<AnimatedFab> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<Color> animation;
  final double expandedSize = 180.0;
  final double hiddenSize = 20.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = ColorTween(begin:Colors.pink, end: Colors.pink[800]).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expandedSize,
      height: expandedSize,
      child: AnimatedBuilder(animation: animationController, builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _buildExpandedBackground(),
            _buildOption(Icons.check_circle, 0.0),
            _buildOption(Icons.flash_on, -math.pi / 3.0),
            _buildOption(Icons.access_alarm, -2 *math.pi / 3.0),
            _buildOption(Icons.forward, math.pi),
            _buildFabCore(),
          ],
        );
      }),
    );

  }

  Widget _buildFabCore() {

    double scaleFactor = 2 * (animationController.value - 0.5).abs();

    return FloatingActionButton(
      onPressed: _onFabTap,
      child: Transform(
          transform: Matrix4.identity()..scale(1.0, scaleFactor),
        alignment: Alignment.center,
        child: Icon(
          animationController.value > 0.5 ? Icons.close : Icons.filter_list,
          color: Colors.white,
          size: 26.0,
        ),
      ),
      backgroundColor: animation.value,
    );
  }

  Widget _buildExpandedBackground() {
    double size = hiddenSize + (expandedSize - hiddenSize) * animationController.value;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
    );
  }

  Widget _buildOption(IconData icon, double angle) {
    double iconSize = 0.0;

    if (animationController.value > 0.8) {
      iconSize = 26 * (animationController.value - 0.8) * 5;
    }

    return Transform.rotate(
      angle: angle,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: IconButton(
            icon: Transform.rotate(
              angle: -angle,
              child: Icon(icon, color: Colors.white,),
            ),
            onPressed: _onIconClick,
            iconSize: iconSize,
            alignment: Alignment.center,
            padding: EdgeInsets.all(0.0),
          ),
        ),
      ),
    );
  }

  open() {
    if (animationController.isDismissed) {
      animationController.forward();
    }
  }

  close() {
    if (animationController.isCompleted) {
      animationController.reverse();
    }
  }

  _onFabTap() {
    print('tap float button ${widget.onClick}');
    if (animationController.isDismissed) {
      open();
    } else {
      close();
    }
  }

  _onIconClick() {
    widget.onClick;
    close();
  }



}

