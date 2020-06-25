import 'package:FlutterWorkshop/playground/GridViewObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewPresentation extends StatefulWidget {
  @override
  _GridViewPresentationState createState() => _GridViewPresentationState();

  @override
  String toStringShort() {
    return "GridView";
  }
}

class _GridViewPresentationState extends State<GridViewPresentation> {
  double _numberOfObjects = 12;
  double _crossAxisCount = 4;
  double _paddingVertical = 10;
  double _paddingHorizontal = 1;
  double _crossAxisSpacing = 0;
  double _mainAxisSpacing = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: Text("GridView",),
        ),
        backgroundColor: Colors.indigo,
        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? Column(
                    children: <Widget>[
                      Expanded(child: getPlayWidget()),
                      getControlWidget()
                    ],
                  )
                : Row(
                    children: <Widget>[
                      Expanded(child: getPlayWidget()),
                      Expanded(child: getControlWidget())
                    ],
                  );
          },
        ));
  }

  Widget getPlayWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: ShapeDecoration(
          color: Colors.indigo,
          shape: Border.all(color: Colors.blueAccent, width: 2)),
      child: GridViewObject(_numberOfObjects, _crossAxisCount, _paddingVertical,
          _paddingHorizontal, _mainAxisSpacing, _crossAxisSpacing),
    );
  }

  Widget getControlWidget() {
    return Table(
      //border: TableBorder.all(color: Colors.black, width: 1),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FlexColumnWidth(6),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(6)
      },
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Text("  number of objects: ",
                style: TextStyle(color: Colors.white)),
            Text(getRounded(_numberOfObjects),
                style: TextStyle(color: Colors.white)),
            Slider(
              min: 1,
              max: 60,
              divisions: 59,
              value: _numberOfObjects,
              onChanged: (value) {
                setState(() {
                  _numberOfObjects = value;
                });
              },
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text("  cross Axis count: ", style: TextStyle(color: Colors.white)),
            Text(getRounded(_crossAxisCount),
                style: TextStyle(color: Colors.white)),
            Slider(
              min: 1,
              max: 20,
              divisions: 19,
              value: _crossAxisCount,
              onChanged: (value) {
                setState(() {
                  _crossAxisCount = value;
                });
              },
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text("  padding vertical: ", style: TextStyle(color: Colors.white)),
            Text(getRounded(_paddingVertical),
                style: TextStyle(color: Colors.white)),
            Slider(
              min: 1,
              max: 200,
              divisions: 99,
              value: _paddingVertical,
              onChanged: (value) {
                setState(() {
                  _paddingVertical = value;
                });
              },
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text("  padding horizontal: ",
                style: TextStyle(color: Colors.white)),
            Text(getRounded(_paddingHorizontal),
                style: TextStyle(color: Colors.white)),
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
        TableRow(
          children: <Widget>[
            Text("  main axis spacing: ",
                style: TextStyle(color: Colors.white)),
            Text(getRounded(_mainAxisSpacing),
                style: TextStyle(color: Colors.white)),
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
        TableRow(
          children: <Widget>[
            Text("  cross axis spacing: ",
                style: TextStyle(color: Colors.white)),
            Text(getRounded(_crossAxisSpacing),
                style: TextStyle(color: Colors.white)),
            Slider(
              min: 0,
              max: 60,
              divisions: 60,
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
    );
  }

  String getRounded(double value) {
    return value.toInt().toString();
  }
}
