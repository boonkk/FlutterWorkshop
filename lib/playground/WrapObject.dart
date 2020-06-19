import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapObject extends StatelessWidget {
  double _numberOfObjects = 10;
  WrapAlignment _wrapAlignment = WrapAlignment.center;
  WrapCrossAlignment _crossAlignment = WrapCrossAlignment.center;
  Axis _direction = Axis.horizontal;
  double _spacing = 0.5;
  double _runSpacing = 0.1;
  VerticalDirection _verticalDirection = VerticalDirection.down;
  WrapAlignment _runAlignment = WrapAlignment.center;

  WrapObject(
      this._numberOfObjects,
      this._wrapAlignment,
      this._crossAlignment,
      this._direction,
      this._spacing,
      this._runSpacing,
      this._verticalDirection,
      this._runAlignment);

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
        //color: Colors.indigo,
      decoration: ShapeDecoration(
          color: Colors.indigo,
          shape: Border.all(color: Colors.blueAccent, width: 2),
        ),
        child: Wrap(
          alignment: _wrapAlignment,
          crossAxisAlignment: _crossAlignment,
          direction: _direction,
          spacing: _spacing,
          runSpacing: _runSpacing,
          verticalDirection: _verticalDirection,
          runAlignment: _runAlignment,
          children: [
            ...List.generate(
              _numberOfObjects.toInt(),
              (index) {
                return Container(
                  width: 50,
                  height: 50,
                  child: Text(
                    "$index",
                    style: TextStyle(color: Colors.white),
                  ),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.redAccent,
                  ),
                );
              },
            )
          ],
        ));
  }
}
