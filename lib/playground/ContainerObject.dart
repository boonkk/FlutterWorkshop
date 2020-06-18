import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerObject extends StatelessWidget {
  double margin;
  double padding;
  Alignment alignment;
  double childSize;


  ContainerObject(this.childSize, this.margin, this.padding, this.alignment);



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(color: Colors.indigoAccent, shape: Border.all(color: Colors.blueAccent, width: 2)),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(color: Colors.indigo, shape: Border.all(color: Colors.lightBlue, width: 2)),
        width: 100,
        height: 100,
        //color: Colors.deepPurple,
        //margin: EdgeInsets.all(margin),
        margin: EdgeInsets.all(margin),
        padding: EdgeInsets.all(padding),
        alignment: alignment,
        child: Container(
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Colors.lightBlueAccent ),
            width: childSize,
            height: childSize,
            //color: Colors.purple,
            child: Text("Child", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            alignment: Alignment.center,
          ),
        ),
    );
  }
}
