import 'package:FlutterWorkshop/playground/ContainerPresentation.dart';
import 'package:FlutterWorkshop/playground/GridViewPresentation.dart';
import 'package:FlutterWorkshop/playground/JsonWidgetDescriptionReader.dart';
import 'package:FlutterWorkshop/playground/SwipeElement.dart';
import 'package:FlutterWorkshop/playground/WrapPresentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Playground extends StatelessWidget {
  JsonWidgetDescriptionReader _jsonDescReader;
  Map descriptionsMap;
  final List<Widget> widgets = [
    ContainerPresentation(),
    GridViewPresentation(),
    WrapPresentation()
  ];


  Future<Map> loadData() {
    _jsonDescReader = JsonWidgetDescriptionReader();
    return _jsonDescReader.loadDataFromFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Playground")),
        body: FutureBuilder(
            future: loadData(),
            builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
              if (snapshot.hasData)
                return Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.indigo, Colors.blueAccent],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight,
                        )),
                    child: Swiper(
                      onTap: (index) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => widgets[index %
                                  widgets.length]),
                        );
                      },
                      loop: true,
                      //todo propably move futurebuilder upper in the tree
                      itemCount: widgets.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        color: Colors.indigoAccent ),
                        margin: EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 120),
                        padding: EdgeInsets.all(10),
//          padding: ,
                        child: SwipeElement(widgets[index].toStringShort(), snapshot.data[widgets[index].toStringShort()])

                        );},));
              else
                return Container();
            }
        )
    );
  }
}

