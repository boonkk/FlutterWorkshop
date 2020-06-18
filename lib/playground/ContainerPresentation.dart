import 'package:FlutterWorkshop/Language.dart';
import 'package:FlutterWorkshop/playground/ContainerObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerPresentation extends StatefulWidget {
  @override
  _ContainerPresentationState createState() => _ContainerPresentationState();

  @override
  String toStringShort() {
    return "Container widget";
  }
}

class _ContainerPresentationState extends State<ContainerPresentation> {
  double _margin = 0;
  double _padding = 0;
  Alignment _alignment = Alignment.centerLeft;
  double _childSize = 100;

  int alIndex = 0;

  static final List<Alignment> _alignments = [
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft
  ];

  void alIndexIncrement() {
    alIndex++;
    if (alIndex > _alignments.length - 1) alIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
            title: Text(
          "Container widget",
          style: TextStyle(color: Colors.white, fontSize: 25),
        )),
        body: OrientationBuilder(
          builder: (context, orientation) {
            //todo change to safe fill screen without scrolling:
            //todo without gridview it fails on landscape orientation
            //todo with gridview it's scrollable
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
              children: <Widget>[
                Container(
                  height: 260,
                  width: double.infinity,
                  child: ContainerObject(
                      _childSize, _margin, _padding, _alignment),
                ),
                Container(
                    child: Column(
                  children: <Widget>[
                    Text("Child Size: $_childSize",
                        style: TextStyle(color: Colors.white)),
                    Slider(
                      min: 0,
                      max: 300,
                      value: _childSize,
                      onChanged: (value) {
                        setState(() {
                          _childSize = value.roundToDouble();
                        });
                      },
                    ),
                    Text("margin parameter: $_margin",
                        style: TextStyle(color: Colors.white)),
                    Slider(
                      min: 0,
                      max: 200,
                      value: _margin,
                      onChanged: (value) {
                        setState(() {
                          _margin = value.roundToDouble();
                        });
                      },
                    ),
                    Text("padding parameter: $_padding",
                        style: TextStyle(color: Colors.white)),
                    Slider(
                      min: 0,
                      max: 200,
                      value: _padding,
                      onChanged: (value) {
                        setState(() {
                          _padding = value.roundToDouble();
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("alignment parameter",
                            style: TextStyle(color: Colors.white)),
                        RaisedButton(
                            child: Text(
                              _alignment.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.indigoAccent,
                            onPressed: () {
                              setState(
                                () {
                                  alIndexIncrement();
                                  _alignment = _alignments[alIndex];
                                },
                              );
                            })
                      ],
                    ),
                  ],
                )),
              ],
            );
          },
        ));
  }
}
