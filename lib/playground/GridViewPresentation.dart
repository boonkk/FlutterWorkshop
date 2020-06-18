import 'package:FlutterWorkshop/playground/GridViewObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewPresentation extends StatefulWidget {
  @override
  _GridViewPresentationState createState() => _GridViewPresentationState();

  @override
  String toStringShort() {
    return "GridView widget";
  }
}

class _GridViewPresentationState extends State<GridViewPresentation> {
  double _numberOfObjects=12;
  double _crossAxisCount = 4;
  double _paddingVertical = 10;
  double _paddingHorizontal = 1;
  double _crossAxisSpacing = 0;
  double _mainAxisSpacing = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView", style: TextStyle(fontSize: 25, color: Colors.white),),),
      backgroundColor: Colors.indigo,
      body: Column(
        children: <Widget>[
          Container(
            width: 300,
            height: 260,
            color: Colors.indigo,
            child: GridViewObject(_numberOfObjects, _crossAxisCount, _paddingVertical,_paddingHorizontal, _mainAxisSpacing,_crossAxisSpacing),
          ),
          Container(
            //todo not too beautiful solution, propably need to use table
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("cross Axis count: ", style: TextStyle(color: Colors.white)),
                    Slider(
                      min: 1,
                      max: 20,
                      divisions: 20,
                      value: _crossAxisCount,
                      onChanged: (value) {
                        setState(() {
                          _crossAxisCount = value;
                        });
                      },
                    ),
                  ],
                ),
               Row(
                 children: <Widget>[
                   Text("number of objects:  ",style: TextStyle(color: Colors.white)),
                   Slider(
                     min: 1,
                     max: 100,
                     divisions: 100,
                     value: _numberOfObjects,
                     onChanged: (value) {
                       setState(() {
                         _numberOfObjects = value;
                       });
                     },
                   ),
                 ],
               ),
                Row(
                  children: <Widget>[
                    Text("padding vertical:  ",style: TextStyle(color: Colors.white)),
                    Slider(
                      min: 1,
                      max: 100,
                      divisions: 100,
                      value: _paddingVertical,
                      onChanged: (value) {
                        setState(() {
                          _paddingVertical = value;
                        });
                      },
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Text("padding horizontal:  ",style: TextStyle(color: Colors.white)),
                    Slider(
                      min: 0,
                      max: 100,
                      divisions: 100,
                      value: _paddingHorizontal,
                      onChanged: (value) {
                        setState(() {
                          _paddingHorizontal = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("main axis spacing:  ",style: TextStyle(color: Colors.white)),
                    Slider(
                      min: 0,
                      max: 100,
                      divisions: 100,

                      value: _mainAxisSpacing,
                      onChanged: (value) {
                        setState(() {
                          _mainAxisSpacing = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("cross axis spacing:  ",style: TextStyle(color: Colors.white)),
                    Slider(
                      min: 0,
                      max: 100,
                      divisions: 100,
                      value: _crossAxisSpacing,
                      onChanged: (value) {
                        setState(() {
                          _crossAxisSpacing = value;
                        });
                      },
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      )
    );
  }
}
