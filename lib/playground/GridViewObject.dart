import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GridViewObject extends StatelessWidget {
  double _numberOfObjects = 12;
  double _crossAxisCount = 4;
  double _paddingVertical = 10;
  double _paddingHorizontal = 1;
  double _crossAxisSpacing = 0;
  double _mainAxisSpacing = 0;


  int colorVal = 0;

  List<Color> colors = [Colors.deepOrange, Colors.purple, Colors.amber, Colors.green, Colors.redAccent ,Colors.blueAccent];


  int getColorIndex(int index) {
    while(index > colors.length-1)
      index -= colors.length;
    return index;
  }
  GridViewObject(this._numberOfObjects, this._crossAxisCount,
      this._paddingVertical, this._paddingHorizontal, this._mainAxisSpacing, this._crossAxisSpacing);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: _crossAxisCount.toInt(),
      mainAxisSpacing: _mainAxisSpacing,
      crossAxisSpacing: _crossAxisSpacing,
      dragStartBehavior: DragStartBehavior.down,

      padding: EdgeInsets.symmetric(
          vertical: _paddingVertical, horizontal: _paddingHorizontal),
      children:
        List.generate(_numberOfObjects.toInt(), (index){
              return Container(
                child: Text("$index", style: TextStyle(color: Colors.white),),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: colors[getColorIndex(index)],
                ),
              );
            },
          )
       ,
    );
  }
}
