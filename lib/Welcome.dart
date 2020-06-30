import 'dart:math';
import 'dart:ui';

import 'package:FlutterWorkshop/playground/Playground.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterWorkshop/flutterjavadiffer/LangDifferences.dart';
import 'package:FlutterWorkshop/quiz/QuizPicker.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _logoAnimation;

  Animation _textRotationAnimation;
  Animation _textSlideAnimation;

  Animation _button1Animation;
  Animation _button2Animation;
  Animation _button3Animation;

  Animation _titleAnimation;

  CustomPaint customPaint;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 1600), vsync: this);
    _logoAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.25, 0.6, curve: Curves.easeInOutSine)));
    _textRotationAnimation = Tween<double>(begin: 0, end: pi / 2).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.10, 0.30, curve: Curves.easeInOutBack)));
    _textSlideAnimation = Tween<double>(begin: 0, end: 400).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.35, 0.5, curve: Curves.easeOutQuint)));
    _button1Animation =
        Tween<double>(begin: 0, end: 400).animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(
              0.2,
              0.5,
              curve: Curves.elasticIn,
            )));
    _button2Animation =
        Tween<double>(begin: 0, end: 400).animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(
              0.4,
              0.7,
              curve: Curves.elasticIn,
            )));
    _button3Animation =
        Tween<double>(begin: 0, end: 400).animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(
              0.6,
              0.9,
              curve: Curves.elasticIn,
            )));
    _titleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.4,
          0.8,
          curve: Curves.easeInBack,
        )));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.indigo, Colors.blueAccent],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          )),
          //margin: EdgeInsets.only(top: 30),
          alignment: Alignment.center,

          child: AnimatedBackground(
              vsync: this,
              behaviour: RandomParticleBehaviour(
                  options: ParticleOptions(
                      particleCount: 10,
                      maxOpacity: 0.4,
                      baseColor: Colors.white70,
                      spawnMaxSpeed: 20,
                      spawnMinSpeed: 10)),
              //behaviour: SpaceBehaviour(backgroundColor: Colors.indigo),
              //behaviour: BubblesBehaviour(options: BubbleOptions(bubbleCount: 5, growthRate: 30, maxTargetRadius: 300, minTargetRadius: 500),),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Opacity(
                            opacity: _logoAnimation.value,
                            child: Transform.scale(
                                scale: _logoAnimation.value * 10));
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                                width: 1, color: Colors.lightBlueAccent)),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: sin(_titleAnimation.value),
                              child: Transform.scale(
                                scale: 1 - _titleAnimation.value,
                                child: child,
                              ),
                            );
                          },
                          child: Text(
                            "Flutter Workshop",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(_logoAnimation.value * 200,
                                  _logoAnimation.value * 300),
                              child: Transform.scale(
                                  scale: 1 - _logoAnimation.value,
                                  child: Transform.rotate(
                                    angle: _logoAnimation.value * 4 * pi,
                                    child: child,
                                  )),
                            );
                          },
                          child: FlatButton(
                            child: FlutterLogo(
                              size: 150,
                            ),
                            onPressed: () async {
                              if (_animationController.status ==
                                  AnimationStatus.completed)
                                await _animationController.reverse();
                              else
                                await _animationController.forward();
                              if (_animationController.status ==
                                  AnimationStatus.completed)
                                _animationController.reverse();
                            },
                            color: Colors.transparent,
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.translate(
                                offset: Offset(0, _textSlideAnimation.value),
                                child: Transform.rotate(
                                    child: child,
                                    angle: _textRotationAnimation.value));
                          },
                          child: Text(
                            "for Java dev",
                            style: TextStyle(fontFamily: "Courier", fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      //margin: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(_button1Animation.value, 0),
                                child: child,
                              );
                            },
                            child: RaisedButton(
                              color: Colors.indigoAccent,
                              child: Text(
                                "Syntax differences Java&Dart",
                                style: TextStyle(
                                  fontFamily: "Courier",
                                ),
                              ),
                              onPressed: () async {
                                await _animationController.forward();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LangDifferences(1)),
                                  //builder: (context) => AnimationWorkshop()),
                                );
                                _animationController.reverse();
                              },
                            ),
                          ),
                          AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(_button2Animation.value, 0),
                                child: child,
                              );
                            },
                            child: RaisedButton(
                              color: Colors.indigoAccent,
                              child: Text(
                                "Take the quiz!",
                                style: TextStyle(
                                  fontFamily: "Courier",
                                ),
                              ),
                              onPressed: () async {
                                await _animationController.forward();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuizPicker()),
                                );
                                _animationController.reverse();
                              },
                            ),
                          ),
                          AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(_button3Animation.value, 0),
                                child: child,
                              );
                            },
                            child: RaisedButton(
                              color: Colors.indigoAccent,
                              child: Text(
                                    "Playground",
                                    style: TextStyle(
                                      fontFamily: "Courier",
                                    ),
                                  ),
                              onPressed: () async {
                                await _animationController.forward();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Playground()),
                                );
                                _animationController.reverse();
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
