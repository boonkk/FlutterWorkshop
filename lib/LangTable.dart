import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'JsonPageReader.dart';

class LangTable extends StatelessWidget {
  String _language;
  String _imageFileName;
  String _description;


  LangTable(this._language, this._imageFileName, this._description);

  @override
  Widget build(BuildContext context) {

    return Column(
          children: <Widget>[
            Container(
              child: Text(_language,
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
                overflow: TextOverflow.ellipsis,
                maxLines: 10,),
              padding: EdgeInsets.only(bottom: 15, left: 25, right: 25),
            ),
            Image.asset(_imageFileName),
          ],
    );
  }
}
