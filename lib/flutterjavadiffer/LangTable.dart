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
            Container(
              child: Text(
                _title,
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(top: 25, bottom: 10),
            ),
            Container(
              child: DefaultTextStyle(
                child: Text(_description),
                style: TextStyle(),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,),
              padding: EdgeInsets.only(bottom: 15, left: 25, right: 25),
            ),
            Image.asset(_imageFileName),
          ],
    );
  }
}
