import 'package:flutter/material.dart';

class SwipeElement extends StatelessWidget {
  String _value;
  SwipeElement(this._value);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      foregroundDecoration: ShapeDecoration(shape: CircleBorder()),
      color: Colors.indigoAccent,
      child: Column(
        children: <Widget>[
          Text(_value,style: TextStyle(fontSize: 30),),
          Text(_value,style: TextStyle(fontSize: 40),)
        ],
      ),
    );
  }


}
