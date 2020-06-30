import 'package:FlutterWorkshop/flutterjavadiffer/Language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'JsonPageReader.dart';

class LangTable extends StatelessWidget {
  String _title;
  String _imageFileName;
  String _description;

  LangTable(this._title, this._imageFileName, this._description);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 25,
        ),
        Container(
          child: DefaultTextStyle(
            child: Text(_description),
            style: TextStyle(),
            textAlign: TextAlign.justify,
            maxLines: 10,
          ),
          padding: EdgeInsets.only(bottom: 15, left: 25, right: 25),
        ),
        SizedBox(
          height: 15,
        ),
        Image.asset(_imageFileName),
        SizedBox(
          height: 35,
        ),
      ],
    );
  }
}
