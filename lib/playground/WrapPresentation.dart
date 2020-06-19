import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'WrapObject.dart';

class WrapPresentation extends StatefulWidget {
  @override
  _WrapPresentationState createState() => _WrapPresentationState();

  @override
  String toStringShort() {
    return "Wrap";
  }
}

class _WrapPresentationState extends State<WrapPresentation> {

  double _numberOfObjects=10;
  WrapAlignment _wrapAlignment = WrapAlignment.start;
  WrapCrossAlignment _crossAlignment = WrapCrossAlignment.center;
  Axis _direction = Axis.horizontal;
  double _spacing = 0.5;
  double _runSpacing = 0.1;
  VerticalDirection _verticalDirection = VerticalDirection.down;
  WrapAlignment _runAlignment = WrapAlignment.start;

  List<VerticalDirection> verticalDirections = [VerticalDirection.down, VerticalDirection.up];
  int vertDirIndex =0;

  List<WrapAlignment> wrapAlignments =[WrapAlignment.start, WrapAlignment.end, WrapAlignment.spaceAround, WrapAlignment.spaceBetween, WrapAlignment.center];
  int wrapAlignmentsIndex = 0;
  int runAlignmentsIndex = 0;

  List<WrapCrossAlignment> crossAlignments = [WrapCrossAlignment.center, WrapCrossAlignment.end, WrapCrossAlignment.start];
  int crossAlignIndex = 0;

  List<Axis> directions = [Axis.horizontal, Axis.vertical];
  int dirIndex = 0;

  processVertDirIndex() {
    vertDirIndex++;
    if (vertDirIndex > verticalDirections.length-1)
      vertDirIndex =0;
  }
  processDirIndex() {
    dirIndex++;
    if(dirIndex > directions.length-1)
      dirIndex=0;
  }

  void processCrossIndex() {
    crossAlignIndex++;
    if(crossAlignIndex > crossAlignments.length-1)
      crossAlignIndex=0;
  }

  void processWAIndex() {
    wrapAlignmentsIndex++;
    if(wrapAlignmentsIndex > wrapAlignments.length-1)
      wrapAlignmentsIndex = 0;
  }

  void processRAIndex() {
    runAlignmentsIndex++;
    if(runAlignmentsIndex > wrapAlignments.length-1)
      runAlignmentsIndex = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap",style: TextStyle(fontSize: 18, color: Colors.white),
        ),),
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
                Expanded(
                    flex: 3,child: getPlayWidget()),
                Expanded(flex: 4, child: getControlWidget())
              ],
            );
          },
        ));
  }

  Widget getControlWidget() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
      children: <Widget>[
        Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(),
            columnWidths: {
              0: FlexColumnWidth(5),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(6)
            },
            children: [
          TableRow(children: [
            Text(
              "number of objects",
            ),
            Text(
              "$_numberOfObjects",
            ),
            Slider(
              min: 1,
              max: 30,
              divisions: 29,
              value: _numberOfObjects,
              onChanged: (value) {
                setState(() {
                  _numberOfObjects = value;
                });
              },
            )
          ]),
          TableRow(children: [
            Text(
              "spacing",
            ),
            Text(
              "$_spacing",
            ),
            Slider(
              min: 0,
              max: 30,
              divisions: 30,
              value: _spacing,
              label: "$_spacing",
              onChanged: (value) {
                setState(() {
                  _spacing = value;
                });
              },
            )
          ]),
          TableRow(children: [
            Text(
              "run spacing",
            ),
            Text(
              "$_runSpacing",
            ),
            Slider(
              min: 0,
              max: 30,
              divisions: 30,
              value: _runSpacing,
              onChanged: (value) {
                setState(() {
                  _runSpacing = value;
                });
              },
            )
          ]),
        ]),
        Table(
          children: [
            TableRow(children: [
              Text(
                "crossAlignment",
              ),
              Text(
                "direction",
              ),
              Text(
                "verticalDirection",
              ),
            ]),
            TableRow(children: [
              RaisedButton(
                child: Text(_crossAlignment.toString().split(".")[1]),
                padding: EdgeInsets.all(2),
                onPressed: () {
                  setState(() {
                    processCrossIndex();
                    _crossAlignment = crossAlignments[crossAlignIndex];
                  });
                },
              ),
              RaisedButton(
                child: Text(_direction.toString().split(".")[1]),
                onPressed: () {
                  setState(() {
                    processDirIndex();
                    _direction = directions[dirIndex];
                  });
                },
              ),
              RaisedButton(
                child: Text(_verticalDirection.toString().split(".")[1]),
                padding: EdgeInsets.all(2),
                onPressed: () {
                  setState(() {
                    processVertDirIndex();
                    _verticalDirection = verticalDirections[vertDirIndex];
                  });
                },
              )
            ]),
          ],
        ),
        Table(

          children: [
            TableRow(children: [
              Text(
                "wrapAlignment",
              ),
              Text(
                "runAlignment",
              ),
            ]),
            TableRow(children: [
              RaisedButton(
                child: Text(_wrapAlignment.toString().split(".")[1]),
                onPressed: () {
                  setState(() {
                    processWAIndex();
                    _wrapAlignment = wrapAlignments[wrapAlignmentsIndex];
                  });
                },
              ),
              RaisedButton(
                child: Text(_runAlignment.toString().split(".")[1]),
                onPressed: () {
                  setState(() {
                    processRAIndex();
                    _runAlignment = wrapAlignments[runAlignmentsIndex];
                  });
                },
              )
            ]),
          ],
        ),
      ],
    ),);
  }

  Widget getPlayWidget() {
    return Container(
        child: WrapObject(_numberOfObjects,
            _wrapAlignment,
            _crossAlignment,
            _direction,
            _spacing,
            _runSpacing,
            _verticalDirection,
            _runAlignment));
     }

  String getRoundedString(double value) {
    return value.toInt().toString();
  }
}
