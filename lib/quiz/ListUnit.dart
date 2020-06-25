import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListUnit extends StatelessWidget {
  String _answer;
  Function onTapped;


  ListUnit(this._answer, this.onTapped);
  //todo add onTap function here with onTapped call in it + some effect mb will work
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        margin: EdgeInsets.only(top: 6, bottom: 6),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.chevron_right,
              color: Colors.white60,
              size: 30,
            ),
             Expanded(child: Text(
                _answer,
                style: TextStyle(color: Colors.white70, fontSize: 23 ,fontFamily: "Courier"),
             ),),
          ],
        ),
      ),
    );
  }
}
