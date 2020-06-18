import 'package:FlutterWorkshop/playground/ContainerPresentation.dart';
import 'package:FlutterWorkshop/playground/GridViewObject.dart';
import 'package:FlutterWorkshop/playground/GridViewPresentation.dart';
import 'package:FlutterWorkshop/playground/SwipeElement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Playground extends StatelessWidget {
  List<Widget> widgets = [
    ContainerPresentation(),
    GridViewPresentation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
        child: Swiper(
      loop: true,
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              color: Colors.indigoAccent ),
          margin: EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 120),
          padding: EdgeInsets.all(10),
//          padding: ,

          child: Center(child: SwipeElement(widgets[index].toStringShort())),
        );
      },
      onTap: (index) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widgets[index%widgets.length]),
        );
      },
    ));
  }
}
