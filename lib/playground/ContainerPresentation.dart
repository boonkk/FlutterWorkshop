import 'package:FlutterWorkshop/Language.dart';
import 'package:FlutterWorkshop/playground/ContainerObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerPresentation extends StatefulWidget {
  @override
  _ContainerPresentationState createState() => _ContainerPresentationState();

  @override
  String toStringShort() {
    return "Container";
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
            backgroundColor: Colors.indigoAccent,
            title: Text("Container widget")),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return Column(children: <Widget>[
                Expanded(child: getPlayWidget()),
                Container(child: getControlWidget(),
                margin: EdgeInsets.all(20),)
              ]);
            } else
              return Row(
                children: <Widget>[
                  Expanded(child: getPlayWidget()),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(20),
                    child: getControlWidget(),
                  )),
                ],
              );
          },
        ));
  }

  Widget getPlayWidget() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: ContainerObject(_childSize, _margin, _padding, _alignment),
    );
  }

  Widget getControlWidget() {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3)
      },
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Text("child size: $_childSize"),
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
          ],
        ),
        TableRow(
          children: <Widget>[
            Text("margin: $_margin"),
            Slider(
              min: 0,
              max: 150,
              value: _margin,
              onChanged: (value) {
                setState(() {
                  _margin = value.roundToDouble();
                });
              },
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text("padding: $_padding"),
            Slider(
              min: 0,
              max: 140,
              value: _padding,
              onChanged: (value) {
                setState(() {
                  _padding = value.roundToDouble();
                });
              },
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text("alignment   "),
            RaisedButton(
                child: Text(_alignment.toString(),),
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
    );
  }
}
