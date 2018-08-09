import 'package:flutter/material.dart';
import 'dart:async';
import 'package:advance_demo/flight/flight_stop.dart';
import 'package:advance_demo/flight/flight_stop_card.dart';

class PriceTab extends StatefulWidget {

  final double height;
  PriceTab({this.height});

  @override
  State<StatefulWidget> createState() {
    return _PriceTabState();
  }

}

class _PriceTabState extends State<PriceTab> with TickerProviderStateMixin {

  final List<FlightStop> _flightStops = [
    FlightStop("JFK", "ORY", "JUN 05", "6h 25m", "\$851", "9:26 am - 3:43 pm"),
    FlightStop("MRG", "FTB", "JUN 20", "6h 25m", "\$532", "9:26 am - 3:43 pm"),
    FlightStop("ERT", "TVS", "JUN 20", "6h 25m", "\$718", "9:26 am - 3:43 pm"),
    FlightStop("KKR", "RTY", "JUN 20", "6h 25m", "\$663", "9:26 am - 3:43 pm"),
  ];

  AnimationController animationController;
  AnimationController _planeTravelController;

  Animation<double> _planeSizeAnimation;
  Animation _planeTravelAnimation;

  AnimationController _dotsAnimationController;
  List<Animation<double>> _dotPositions = [];

  final double _cardHeight = 80.0;

  final double _initialPlanePaddingBottom = 16.0;
  final double _minPlanePaddingTop = 16.0;
  double get _planeTopPadding => _minPlanePaddingTop + (1 - _planeTravelAnimation.value) * _maxPlaneTopPadding;
  double get _maxPlaneTopPadding => widget.height - _initialPlanePaddingBottom - _planSize - _minPlanePaddingTop;
  double get _planSize => 60.0;

  @override
  void initState() {
    super.initState();
    _initSizeAnimations();
    _initPlaneTravelAnimations();
    _initDotAnimationController();
    _initDotAnimations();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    _planeTravelController.dispose();
    _dotsAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildPlane(),
        ]
          ..addAll(_flightStops.map(_buildStopCard))
          ..addAll(_flightStops.map(_mapFlightStopToDot)),
      ),
    );
  }

  Widget _buildStopCard(FlightStop stop) {
    int index = _flightStops.indexOf(stop);
    double topMargin = _dotPositions[index].value -
        0.5 * (FlightStopCard.height - AnimatedDot.size);
    bool isLeft = index.isOdd;
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: topMargin),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isLeft ? Container() : Expanded(child: Container()),
            Expanded(
              child: FlightStopCard(
                flightStop: stop,
                isLeft: isLeft,
              ),
            ),
            !isLeft ? Container() : Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  Widget _mapFlightStopToDot(stop) {
    int index = _flightStops.indexOf(stop);
    bool isStartOrEnd = index == 0 || index == _flightStops.length - 1;
    Color color = isStartOrEnd ? Colors.red : Colors.green;
    return AnimatedDot(color: color, animation: _dotPositions[index],);
  }

  Widget _buildPlane() {
    return AnimatedBuilder(
      animation: _planeTravelAnimation,
      child: Column(
        children: <Widget>[
          AnimatedPlaneIcon(animation: _planeSizeAnimation,),
          Container(
            width: 2.0,
            height: _flightStops.length * _cardHeight * 0.8,
            color: Color.fromARGB(255, 200, 200, 200),
          ),
        ],
      ),
      builder: (context, widget) {
        return Positioned(
          top: _planeTopPadding,
          child: widget,
        );
      },
    );
  }

  void _initSizeAnimations() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 340))..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500), () {
          _planeTravelController.forward();
        });
        
        Future.delayed(Duration(milliseconds: 700), () {
          _dotsAnimationController.forward();
        });
      }
    });
    _planeSizeAnimation = Tween<double>(begin: 60.0, end: 36.0).animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
  }

  void _initPlaneTravelAnimations() {
    _planeTravelController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _planeTravelAnimation = CurvedAnimation(parent: _planeTravelController, curve: Curves.fastOutSlowIn);
  }

  void _initDotAnimationController() {
    _dotsAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  void _initDotAnimations() {
    //what part of whole animation takes one dot travel
    final double slideDurationInterval = 0.4;
    //what are delays between dot animations
    final double slideDelayInterval = 0.2;
    //at the bottom of the screen
    double startingMarginTop = widget.height;
    //minimal margin from the top (where first dot will be placed)
    double minMarginTop = _minPlanePaddingTop + _planSize + 0.5 * (0.8 * _cardHeight);

    for (int i = 0; i < _flightStops.length; i ++) {
      final start = i * slideDelayInterval;
      final end = start + slideDurationInterval;

      double finalMarginTop = minMarginTop + i * (0.8 * _cardHeight);

      Animation<double> animation = Tween(
          begin: startingMarginTop, end: finalMarginTop).animate(
          CurvedAnimation(parent: _dotsAnimationController,
              curve: Interval(start, end, curve: Curves.easeOut)));


      _dotPositions.add(animation);
    }
  }
}

class AnimatedPlaneIcon extends AnimatedWidget {

  AnimatedPlaneIcon({Key key, Animation<double> animation}) :
        super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable;
    return Icon(Icons.airplanemode_active, color: Colors.red, size: animation.value,);
  }

}

class AnimatedDot extends AnimatedWidget {

  static final double size = 24.0;

  final Color color;
  AnimatedDot({Key key, @required this.color, Animation<double> animation}) :
      super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable;
    return Positioned(
      top: animation.value,
      child:  Container(
        height: 24.0,
        width: 24.0,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Color(0xFFDDDDDD), width: 1.0)),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: DecoratedBox(decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        ),
      ),
    );

  }

}