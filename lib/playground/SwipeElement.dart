import 'package:flutter/material.dart';

class SwipeElement extends StatelessWidget {
  String _value;
  SwipeElement(this._value);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: double.infinity,
        color: Colors.indigoAccent,
        child: Container(
          alignment: Alignment.center,
          child:
          Text(_value,style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Courier"),),
        ),
      ),
    );
  }


}
